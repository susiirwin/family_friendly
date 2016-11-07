class Businesses::ReviewsController < ApplicationController
  def new
    @business = Business.find_by(params[:format])
    @review = @business.reviews.new
  end
end
