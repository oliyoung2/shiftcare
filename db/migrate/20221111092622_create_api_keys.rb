class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.string :key
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
