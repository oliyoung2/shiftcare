class CreateJoinTableBookingEmployee < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bookings, :employees do |t|
      t.index [:booking_id, :employee_id]
      t.index [:employee_id, :booking_id]
    end
  end
end
