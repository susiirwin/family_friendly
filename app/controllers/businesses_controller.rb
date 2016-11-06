class BusinessesController < ApplicationController
  def show
    @business = Business.find_by(params)
    require 'pry'; binding.pry
  end
end
