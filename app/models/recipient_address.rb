class RecipientAddress < ApplicationRecord
  belongs_to :recipient
  has_one :address, as: :addressable

  before_create :set_as_default_if_first

  accepts_nested_attributes_for :address

  def set_as_default_if_first
    self.default = true if recipient.recipient_addresses.where.not(id: nil).empty?
  end
end
