class Organization < ApplicationRecord
  belongs_to :owner, polymorphic: true

  has_many :organization_members
  has_many :members, through: :organization_members, source: :member

  has_many :service_requests
  has_many :recipients, through: :service_requests

  has_one :billing_address, as: :addressable, class_name: 'Address'

  has_many :warehouses
  has_many :warehouse_addresses, through: :warehouses, source: :address

  has_one :default_warehouse, -> { where(default: true) }, class_name: 'Warehouse'
  delegate :address, to: :default_warehouse, prefix: true
end
