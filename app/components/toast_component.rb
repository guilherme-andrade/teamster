class ToastComponent < ApplicationComponent
  attr_reader :type, :content, :title, :time

  with_content_areas :time, :title

  CLASS_MAPPINGS = {
    alert: 'danger',
    notice: 'primary'
  }.freeze

  def initialize(type: 'primary')
    @type = type
  end

  def classes
    return " toast-#{CLASS_MAPPINGS[type]}" if CLASS_MAPPINGS.key? type
    return " toast-#{type}" if type
  end
end
