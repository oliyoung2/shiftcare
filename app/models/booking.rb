# == Schema Information
#
# Table name: bookings
#
#  id            :bigint           not null, primary key
#  aasm_state    :string
#  address       :string           not null
#  booking_at    :datetime         not null
#  discarded_at  :datetime
#  email_address :string           not null
#  lat           :float
#  lng           :float
#  notes         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  client_id     :bigint
#  created_by_id :bigint           not null
#
# Indexes
#
#  index_bookings_on_client_id     (client_id)
#  index_bookings_on_discarded_at  (discarded_at)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
class Booking < ApplicationRecord
  include AASM
  include Discard::Model

  belongs_to :client
  has_and_belongs_to_many :employees

  belongs_to :created_by, class_name: "User"

  validates :email_address, presence: true
  validates :booking_at, presence: true
  validates :address, presence: true

  accepts_nested_attributes_for :client

  aasm do
    state :unconfirmed, initial: true
    state :confirmed, :completed

    event :complete do
      transitions from: :confirmed, to: :completed, after: proc { update(completed_at: Time.now) }
    end
  end
end
