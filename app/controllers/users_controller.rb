class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  
  def index
  @users = User.all
  @user = current_user
  end

  def show
  @book = Book.new
  @user = User.find(params[:id])
  @books = @user.books.all
  @user = current_user
  end

  def edit
  @user = User.find(params[:id]) 
  end

  def update
  @user = User.find(params[:id])
     if @user.update(user_params)
     flash[:update] = "You have updated user successfully."
     redirect_to user_path(@user)
     else
      @user = User.find(params[:id]) 
      render :edit
     end
  end

private
  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction )
  end
end
