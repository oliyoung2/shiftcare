# == Schema Information
#
# Table name: clients
#
#  id            :bigint           not null, primary key
#  address       :string           not null
#  date_of_birth :date
#  discarded_at  :datetime
#  email_address :string
#  firstname     :string
#  notes         :string
#  phone_number  :string
#  surname       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_clients_on_discarded_at  (discarded_at)
#
class Client < ApplicationRecord
  include Discard::Model

  has_one :booking

  validates :address, presence: true

  def to_s
    name
  end

  def name
    [firstname, surname].compact.join(" ")
  end
end
