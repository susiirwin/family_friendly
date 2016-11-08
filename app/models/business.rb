class Business < ApplicationRecord
  has_many :reviews
  has_many :business_amenities
  has_many :amenities, through: :business_amenities

  def self.find_all_qualifying_restaurants(params)
    results = Yelp.client.search('Denver', { term: params[:search] })
    results.businesses.map do |business|
      b = Business.find_or_initialize_by(yelp_id: business.id)
      b.name = business.name
      b.yelp_id = business.id
      b.star_rating = business.rating
      b.address = business.location.display_address
      b.phone = business.display_phone
      b.save!
      b
    end
  end

  def average_family_friendly_rating
    average_rating = reviews.average(:family_rating)
    average_rating.to_f.round(2)

  end
end
