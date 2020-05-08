class Warehouse < ApplicationRecord
  belongs_to :organization
  belongs_to :address

  before_create :set_as_default_if_first

  accepts_nested_attributes_for :address

  def set_as_default_if_first
    self.default = true if organization.warehouses.where.not(id: nil).empty?
  end
end
