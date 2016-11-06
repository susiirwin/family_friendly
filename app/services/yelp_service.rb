class YelpService
  def self.conn(city)
    Yelp.client.search('Denver')
  end
end
