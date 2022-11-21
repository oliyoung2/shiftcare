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
require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
