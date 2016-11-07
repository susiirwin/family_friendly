class Business < ApplicationRecord
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
end
