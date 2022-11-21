class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :kind
      t.string :firstname
      t.string :surname
      t.string :email_address
      t.string :address
      t.string :phone_number
      t.datetime :discarded_at, index: true
      t.timestamps
    end
  end
end
