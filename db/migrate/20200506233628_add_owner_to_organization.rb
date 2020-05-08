class AddOwnerToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_reference :organizations, :owner, polymorphic: true, null: false
  end
end
