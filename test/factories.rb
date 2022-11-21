Faker::Config.locale = "en-AU"

FactoryBot.define do
  factory(:user) do
    email_address { Faker::Internet.email }
    firstname { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    password { "password" }
  end

  factory(:employee) do
    email_address { Faker::Internet.email }
    firstname { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    kind { "plumber" }
    phone_number { Faker::PhoneNumber.phone_number }
    after(:create) do |employee|
      create_list(:vehicle, rand(3), employee: employee)
    end
  end

  factory(:client) do
    address { "1 Smith Street, Smithville" }
    date_of_birth { (rand(30..59) * 365).days.ago }
    firstname { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    notes { Faker::Lorem.sentence }
    phone_number { Faker::PhoneNumber.phone_number }
  end

  factory(:booking) do
    address { "1 Smith Street, Smithville" }
    booking_at { rand(50).days.from_now }
    email_address { Faker::Internet.email }
    notes { Faker::Lorem.sentence }
    aasm_state { ["confirmed", "unconfirmed", "completed"].sample }
    client
    created_by { create(:user) }
    after(:create) do |booking|
      rand(10).times do
        booking.employees.push(create(:employee))
      end
    end
  end

  factory(:vehicle) do
    name { Faker::Lorem.word }
    registration { SecureRandom.hex }
    employee
  end
end
