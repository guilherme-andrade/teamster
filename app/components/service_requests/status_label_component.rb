class ServiceRequests::StatusLabelComponent < ServiceRequests::BaseComponent
  delegate :status, to: :service_request

  CLASS_MAPPINGS = {
    alert: 'danger',
    notice: 'primary',
    fallback: 'primary'
  }.freeze

  def initialize(service_request:)
    @service_request = service_request
  end

  def content
    t("components.service_request.#{status}")
  end

  def classes
    return " badge-#{CLASS_MAPPINGS[status]}" if CLASS_MAPPINGS.key? status

    " badge-#{CLASS_MAPPINGS[:fallback]}"
  end
end
