class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.text :name_ciphertext
      t.text :lat_ciphertext
      t.text :lng_ciphertext
      t.text :address_line_1_ciphertext
      t.text :address_line_2_ciphertext

      t.text :city_id_ciphertext, foreign_key: true
      t.index :city_id_ciphertext

      t.references :addressable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
