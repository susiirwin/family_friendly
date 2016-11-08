class Amenity < ApplicationRecord
  has_many :business_amenities
  has_many :businesses, through: :business_amenities
end
