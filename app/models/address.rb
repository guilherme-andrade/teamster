class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  encrypts :name, :address_line_1, :address_line_2
  encrypts :lat, :lng, type: :float
  encrypts :city_id, type: :integer

  delegate :country, :state, to: :city

  delegate :name, to: :country, prefix: true
  delegate :name, to: :state, prefix: true
  delegate :name, to: :city, prefix: true

  after_validation :geocode
  geocoded_by :full_address, latitude: :lat, longitude: :lng

  def full_address
    [address_line_1, city_name, state_name, country_name].compact.join(', ')
  end

  def city
    City.find(city_id)
  end
end
