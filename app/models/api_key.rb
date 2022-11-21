# == Schema Information
#
# Table name: api_keys
#
#  id          :bigint           not null, primary key
#  key         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :bigint           not null
#
# Indexes
#
#  index_api_keys_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
class ApiKey < ApplicationRecord
  include Discard::Model

  belongs_to :employee
end
