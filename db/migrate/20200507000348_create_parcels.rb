class CreateParcels < ActiveRecord::Migration[6.0]
  def change
    create_table :parcels do |t|
      t.references :service_request, null: false, foreign_key: true

      t.decimal :weight_value, precision: 10, scale: 2, default: 0
      t.string :weight_unit, limit: 12, default: "kg"

      t.decimal :length_value, precision: 10, scale: 2, default: 0
      t.string :length_unit, limit: 12, default: "cm"

      t.decimal :width_value, precision: 10, scale: 2, default: 0
      t.string :width_unit, limit: 12, default: "cm"

      t.decimal :height_value, precision: 10, scale: 2, default: 0
      t.string :height_unit, limit: 12, default: "cm"
      t.timestamps
    end
  end
end
