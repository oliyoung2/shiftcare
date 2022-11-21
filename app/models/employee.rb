# == Schema Information
#
# Table name: employees
#
#  id            :bigint           not null, primary key
#  address       :string
#  discarded_at  :datetime
#  email_address :string
#  firstname     :string
#  kind          :string
#  phone_number  :string
#  surname       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_employees_on_discarded_at  (discarded_at)
#
class Employee < ApplicationRecord
  include Discard::Model
  extend Enumerize

  enumerize :kind, in: [:plumber]

  has_many :bookings
  has_many :vehicles
  has_many :api_keys
  has_many :clients, through: :bookings

  def to_s
    name
  end

  def name
    [firstname, surname].compact.join(" ")
  end
end
