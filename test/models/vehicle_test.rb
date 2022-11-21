# == Schema Information
#
# Table name: vehicles
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  name         :string
#  registration :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :bigint           not null
#
# Indexes
#
#  index_vehicles_on_discarded_at  (discarded_at)
#  index_vehicles_on_employee_id   (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
require "test_helper"

class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
