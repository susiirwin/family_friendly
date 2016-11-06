class SearchController < ApplicationController
  def index
    @results = Business.find_all_qualifying_restaurants(params)
  end
end
