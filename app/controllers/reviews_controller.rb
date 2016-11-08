class ReviewsController < ApplicationController
  def new
    business = Business.find(params[:business_id])
    review = business.reviews.new
    @review_object = ReviewFormObject.new(review, Amenity.all)
  end

  def create
    @review = Review.new(complete_review_params)
    if @review.save
      flash[:notice] = "Thank you for your review!!"
      redirect_to business_path(@review.business.yelp_id)
    else
      require 'pry'; binding.pry
      flash[:error] = @review.errors.full_messages
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:comments, :family_rating, amenity_ids: [])
  end

  def complete_review_params
    complete_credentials = review_params
    complete_credentials[:business_id] = params[:business_id]
    complete_credentials[:user] = current_user

    complete_credentials
  end
end
