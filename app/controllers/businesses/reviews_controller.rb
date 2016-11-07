class Businesses::ReviewsController < ApplicationController
  def new
    require 'pry'; binding.pry
    @business = Business.find_by(yelp_id: params[:id])
    @review = @business.reviews.new
  end
end
