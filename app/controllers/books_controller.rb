class BooksController < ApplicationController

  def index
  @users = User.all
  # @books?
  end

  def show
    @user = User.find(params[:id])
  end

end

 
 