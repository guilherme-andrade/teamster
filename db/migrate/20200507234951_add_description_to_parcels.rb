class AddDescriptionToParcels < ActiveRecord::Migration[6.0]
  def change
    add_column :parcels, :description, :string
  end
end
