class CreateServiceRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :service_requests do |t|
      t.references :recipient, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.text :description
      t.text :notes
      t.integer :pickup_address_id
      t.string :delivery_address_id
      t.string :pickup_tracking_link
      t.datetime :pickup_after
      t.datetime :pickup_before
      t.time :picked_up_at
      t.datetime :deliver_after
      t.datetime :deliver_before
      t.string :delivery_tracking_link
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
