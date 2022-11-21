class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :aasm_state
      t.datetime :booking_at, null: false
      t.string :email_address, null: false
      t.string :address, null: false
      t.float :lat
      t.float :lng
      t.string :notes
      t.references :client, foreign_key: true
      t.bigint :created_by_id, null: false
      t.datetime :discarded_at, index: true
      t.timestamps
    end
  end
end
