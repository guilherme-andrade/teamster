class CreatePersonalProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_profiles do |t|
      t.text :first_name_ciphertext
      t.text :last_name_ciphertext
      t.text :mobile_number_ciphertext
      t.text :mobile_country_id_ciphertext
      t.text :nationality_id_ciphertext
      t.text :vat_number_ciphertext
      t.text :id_number_ciphertext
      t.text :birthday_ciphertext

      t.references :owner, polymorphic: true, null: false
      t.timestamps
    end
  end
end
