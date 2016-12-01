class BusinessAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :business
end
