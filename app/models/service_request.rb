class ServiceRequest < ApplicationRecord
  STATUS_CODES = {
    delivery_failure: -30,
    cancelled: -5,
    pending: 0,
    accepted: 5,
    awaiting_pickup: 10,
    awaiting_delivery: 20,
    delivered: 30
  }.with_indifferent_access.freeze

  belongs_to :recipient
  belongs_to :organization

  belongs_to :delivery_address, class_name: 'Address', default: -> { recipient.default_address }
  belongs_to :pickup_address, class_name: 'Address', default: -> { organization.default_warehouse_address }

  has_many :parcels

  enum status: STATUS_CODES

  def tracking_link
    status_code <= 20 ? pickup_tracking_link : delivery_tracking_link
  end

  def status_code
    STATUS_CODES[status]
  end
end
