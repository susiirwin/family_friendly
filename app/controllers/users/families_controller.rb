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
      flash.now[:danger] = @family.errors.full_messages
      render :new
    end
  end

  private
  def family_params
    params.require(:family).permit(:name, :age, :user_id)
  end
end
