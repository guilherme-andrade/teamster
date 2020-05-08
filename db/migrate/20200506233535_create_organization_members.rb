class CreateOrganizationMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_members do |t|
      t.references :member, polymorphic: true, null: false
      t.references :organization, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
