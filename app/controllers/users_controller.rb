class UsersController < ApplicationController
    
　def top
　end
　
　def index
　@users = User.all
  @user = Use.new
　end
　
　def show
　end
　
　def edit
　end
　
　def update
　end
  
　def user_params
  params.require(:user).permit(:profile_image, :name, :introduction, )
　end
end