class OrganizationMember < ApplicationRecord
  belongs_to :member, polymorphic: true
  belongs_to :organization
end
