class ServiceRequestForm < ApplicationForm
  ATTRIBUTES = [
    :recipient_id, :new_recipient, :recipient_mobile_number,:recipient_first_name, :recipient_last_name, :recipient_address_line_1,
    :recipient_default_address, :description, :notes, :pickup_address_id, :delivery_address_id,
    :pickup_tracking_link, :pickup_after, :pickup_before, :picked_up_at, :deliver_before,
    :deliver_after, :deliver_range, :pickup_range, :delivery_tracking_link, :status,
    :parcels, :pickup_during_work_hours, :deliver_between_start, :deliver_between_end
  ].freeze

  attr_accessor *ATTRIBUTES

  def initalize(attributes = {})
    super
    set_defaults
  end

  def model_name
    ActiveModel::Name.new(ServiceRequest)
  end

  private

  def persist!
  end

  def set_defaults
  end
end
