class AddBarcodeToParcels < ActiveRecord::Migration[6.0]
  def change
    add_column :parcels, :barcode, :string
  end
end
