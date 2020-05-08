class ParcelForm < ApplicationForm
  ATTRIBUTES = %i[weight_value height_value width_value length_value].freeze

  attr_accessor *ATTRIBUTES

  validates , presence: true

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
