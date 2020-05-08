class CreateRecipientAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :recipient_addresses do |t|
      t.references :recipient, null: false, foreign_key: true
      t.boolean :default, default: false

      t.timestamps
    end
  end
end
