class SearchController < ApplicationController
  def index
    # this page needs to show all of the search results from the query - they need to be parsed and the YelpService does that for you

    @results = Business.find_one(params)
  end

  private
    def search_params
      params.require(:search)
    end

end
