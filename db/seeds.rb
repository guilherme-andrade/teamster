require 'measured'

country = Country.create(name: 'Portugal', code: 'PT', phone_code: '+351')

state = country.states.create(name: 'Lisboa')

city = state.cities.create(name: 'Lisboa')

recipient = Recipient.create(
  first_name: 'some',
  last_name: 'dude',
  recipient_addresses_attributes: [
    { address_attributes: { address_line_1: 'Rua dos Açores 84', city_id: city.id } }
  ]
)

user = User.create(email: 'email@example.com', password: '123456')

org = user.create_organization(name: 'Org 1')

warehouse = org.warehouses.create(address_attributes: { address_line_1: 'Avenida de Berna 20', city_id: city.id, addressable: org })

service_request = org.service_requests.create(
  recipient: recipient,
  deliver_before: (DateTime.now.next_day(4) + 1.hour).at_beginning_of_hour,
  deliver_after: DateTime.now.next_day(4).at_beginning_of_hour,
  pickup_before: (DateTime.now.next_day(4) - 1.hours).at_beginning_of_hour,
  pickup_after: (DateTime.now.next_day(4) - 2.hours).at_beginning_of_hour,
)

service_request.parcels.create(
  width: Measured::Length.new(10, 'cm'),
  length: Measured::Length.new(10, 'cm'),
  height: Measured::Length.new(10, 'cm'),
  weight: Measured::Weight.new(1, 'kg')
)
