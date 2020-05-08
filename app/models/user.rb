class User < ApplicationRecord
  store :settings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :membership, as: :member, class_name: 'OrganizationMember'

  has_one :organization, as: :owner
  has_one :personal_profile, as: :owner
  has_one :address, as: :addressable

  encrypts :email, :settings
  blind_index :email
end
