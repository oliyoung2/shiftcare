class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :registration
      t.references :employee, null: false, foreign_key: true
      t.datetime :discarded_at, index: true
      t.timestamps
    end
  end
end
