class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.boolean :default, null: false, default: false
      t.string :name

      t.timestamps
    end
  end
end
