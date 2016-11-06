class BusinessesController < ApplicationController
  def show
    @business = Business.find_by(params)
  end
end
