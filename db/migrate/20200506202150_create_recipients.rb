class CreateRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :mobile_phone_country_id
      t.string :mobile_number
      t.integer :home_address_id
      t.integer :work_address_id
      t.integer :nationality_country_id

      t.timestamps
    end
    add_index :recipients, :nationality_country_id
    add_index :recipients, :mobile_phone_country_id
  end
end
