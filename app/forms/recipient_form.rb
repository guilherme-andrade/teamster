class RecipientForm < ApplicationForm
  delegate :first_name, :last_name, to: :recipient, prefix: true

  property :first_name
  property :last_name
  property :address, form: AddressForm
end
