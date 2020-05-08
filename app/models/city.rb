class City < ApplicationRecord
  belongs_to :state
  has_many :addresses

  delegate :country, to: :state
end
