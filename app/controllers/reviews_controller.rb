class ReviewsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def new
    business = Business.find(params[:business_id])
    review = business.reviews.new
    @review_object = ReviewFormObject.new(review, Amenity.all)
  end

  def create
    @review = Review.new(complete_review_params)
    @review.business.amenity_ids += params[:business][:amenity_ids]
    if @review.save
      flash[:notice] = "Thank you for your review!!"
      redirect_to business_path(@review.business.yelp_id)
    else
      flash[:error] = @review.errors.full_messages
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:comments, :family_rating)
  end

  def amenity_params
    params[:amenity_ids]
  end

  def complete_review_params
    complete_credentials = review_params
    complete_credentials[:business_id] = params[:business_id]
    complete_credentials[:user] = current_user
    complete_credentials
  end

end
