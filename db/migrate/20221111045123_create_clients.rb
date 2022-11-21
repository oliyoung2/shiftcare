class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :surname
      t.date :date_of_birth
      t.string :notes
      t.string :address, null: false
      t.string :email_address
      t.string :phone_number
      t.datetime :discarded_at, index: true
      t.timestamps
    end
  end
end
