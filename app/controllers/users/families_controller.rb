class Users::FamiliesController < ApplicationController
  def new
    @user = current_user
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
      if @family.save
       flash[:notice] = "New Family Member added to your profile!"
       redirect_to dashboard_url
      else
       render :action => 'new'
      end
  end

  private
  def family_params
    params.require(:family).permit(:name, :age)
  end
end
