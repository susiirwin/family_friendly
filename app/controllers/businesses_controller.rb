class BusinessesController < ApplicationController
  def show
    @business = Business.find_by(yelp_id: params[:id])
  end
end
