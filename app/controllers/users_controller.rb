class UsersController < ApplicationController
  before_action :ensure_correct_user,only: [:edit, :update]

  def index
  @users = User.all
  @book_new = Book.new
  @user = current_user
  end

  def show
  @book_new = Book.new
  @user = User.find(params[:id])
  @books = @user.books.all
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
      @users = User.find(params[:id]) 
      render :edit
     end
  end

private
  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction )
  end
  
  # 他のユーザーの情報変更をしようとしても、自分のユーザー詳細画面に戻るように
  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
