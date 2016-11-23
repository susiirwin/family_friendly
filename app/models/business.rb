class Business < ApplicationRecord
  attr_reader :average_family_friendly_rating,
              :gather_comments
  has_many :reviews
  has_many :business_amenities
  has_many :amenities, through: :business_amenities

  def self.find_all_qualifying_restaurants(params)
    results = Yelp.client.search('Downtown Denver', { term: params[:search] })
    # require 'pry'; binding.pry
    results.businesses.map do |business|
      b = Business.find_or_initialize_by(yelp_id: business.id)
      b.name = business.name
      b.yelp_id = business.id
      b.star_rating = business.rating
      b.address = business.location.display_address.join(", ")
      b.phone = business.display_phone
      b.categories = business.categories.join(', ')
      b.save!
      b
    end
  end

  def average_family_friendly_rating
    average_rating = reviews.average(:family_rating)
    average_rating.to_f.round(2)
  end

  def gather_comments
    reviews.map do |review|
      review.comments
    end
  end

  def show_amenities
    business_amenities.map do |amenity|
      amenity = Amenity.find(amenity.amenity_id)
      amenity.amenity_name
    end
  end
end
