# frozen_string_literal: true

FactoryBot.define do
  factory :recipient_address do
    address { nil }
    recipient { nil }
    default { false }
  end

  factory :parcel do
    service_request { nil }
  end

  factory :organization_member do
    member { nil }
    organization { nil }
    role { 1 }
  end

  factory :personal_profile do
    first_name { "MyString" }
    last_name { "MyString" }
    owner { nil }
    mobile_number { "MyString" }
    mobile_country_id { 1 }
    nationality_id { 1 }
    vat_number { "MyString" }
    id_number { "MyString" }
  end

  factory :service_request do
    recipient { nil }
    description { "MyText" }
    notes { "MyText" }
    pickup_address_id { 1 }
    delivery_address_id { "MyString" }
    pickup_tracking_link { "MyString" }
    pickup_after { "2020-05-06 22:45:13" }
    pickup_before { "2020-05-06 22:45:13" }
    picked_up_at { "2020-05-06 22:45:13" }
    deliver_before { "2020-05-06 22:45:13" }
    delivery_tracking_link { "MyString" }
    status { 1 }
  end

  factory :warehouse do
    organization { nil }
    address { nil }
    name { "MyString" }
  end

  factory :recipient do
    first_name { "MyString" }
    last_name { "MyString" }
    mobile_phone_country_id { 1 }
    mobile_number { "MyString" }
    home_address_id { 1 }
    work_address_id { 1 }
    nationality_country_id { 1 }
  end

  factory :address do
    name { "MyString" }
    lat { 1.5 }
    lng { 1.5 }
    address_line_1 { "MyString" }
    address_line_2 { "MyString" }
    addressable { nil }
    city { nil }
  end

  factory :city do
    name { "MyString" }
    state { nil }
  end

  factory :state do
    name { "MyString" }
    country { nil }
  end

  factory :country do
    name { "MyString" }
    code { "MyString" }
  end

  factory :organization do
    name { "MyString" }
    about { "MyText" }
  end

  factory :user do

  end
end
