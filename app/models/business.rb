class Business
  def self.find_all_qualifying_restaurants(params)
    Yelp.client.search('Denver', { term: params[:search] })
  end
end
