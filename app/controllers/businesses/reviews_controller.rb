class Businesses::ReviewsController < ApplicationController
  def new
    @business = Business.find_by(yelp_id: params[:id])
    @review = @business.reviews.new
  end

  def create
    require 'pry'; binding.pry
  end
end
