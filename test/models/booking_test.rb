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
require "test_helper"

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
