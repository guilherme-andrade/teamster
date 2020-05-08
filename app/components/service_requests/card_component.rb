class ServiceRequests::CardComponent < ServiceRequests::BaseComponent
  with_collection_parameter :service_request

  attr_reader :service_request

  delegate :recipient, :tracking_link, :delivery_address, :deliver_before, :pickup_before, to: :service_request
  delegate :full_address, to: :delivery_address, prefix: :delivery
  delegate :name, to: :recipient, prefix: true

  def initialize(service_request:)
    @service_request = service_request
  end
end
