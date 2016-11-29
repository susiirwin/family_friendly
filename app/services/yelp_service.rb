class YelpService
  def self.conn(location)
    Yelp.client.search('Denver')
  end

  def self.search_business(yelp_id)
    Yelp.client.business(yelp_id)
  end
end
