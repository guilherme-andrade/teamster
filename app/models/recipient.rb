class Recipient < ApplicationRecord
  has_many :service_requests
  has_many :recipient_addresses
  has_many :addresses, through: :recipient_addresses

  has_one :default_recipient_address, -> { where(default: true) }, class_name: 'RecipientAddress'

  delegate :address, to: :default_recipient_address, prefix: 'default'

  accepts_nested_attributes_for :recipient_addresses

  def name
    [first_name, last_name].join(' ')
  end
end
