class ServiceRequests::BaseComponent < ApplicationComponent
  attr_reader :service_request

  def intialize(service_request: nil)
    @service_request = service_request
  end
end
