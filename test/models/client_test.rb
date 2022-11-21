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
require "test_helper"

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
