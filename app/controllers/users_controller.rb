class UsersController < ApplicationController
  
  def index
  @users = User.all
  @user = User.new
  end

  def show
  @user = User.find(params[:id])
  end

  def edit
  @user = User.find(params[:id]) 
  end

  def update
  @user = user.find(params[:id])
     if @user.update(users_params)
     flash[:update] = "You have updated user successfully."
     redirect_to user_path(@book)
     else
      @user = User.find(params[:id]) 
      render :edit
     end
  end

  def user_params
  params.require(:user).permit(:profile_image, :name, :introduction, )
  end
end