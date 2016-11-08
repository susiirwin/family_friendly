class ReviewsController < ApplicationController
  def new
    business = Business.find(params[:business_id])
    @review = business.reviews.new
  end

  def create
    @review = Review.new(complete_review_params)
    if @review.save
      flash[:notice] = "Thank you for your review!!"
      redirect_to '/dashboard'
    else
      flash.now[:danger] = @review.errors.full_messages
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:comments, :family_rating)
  end

  def complete_review_params
    complete_credentials = review_params
    complete_credentials[:business_id] = params[:business_id]
    complete_credentials[:user] = current_user
    complete_credentials
  end
end
