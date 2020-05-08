class PersonalProfile < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :mobile_country, foreign_key: 'mobile_country_id', class_name: 'Country', optional: true, default: -> { nationality }
  belongs_to :nationality, foreign_key: 'nationality_id', class_name: 'Country', optional: true

  encrypts :first_name, :last_name, :mobile_number, :vat_number, :id_number
  encrypts :mobile_country_id, :nationality_id, type: :integer
  encrypts :birthday, type: :date
end
