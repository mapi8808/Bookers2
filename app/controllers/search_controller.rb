class SearchController < ApplicationController
  def search
    @user_or_book = params[:option]
    if @user_or_book == "1"
      @users = User.search(params[:search], @user_or_post)
    else
      @books = Book.search(params[:search], @user_or_post)
    end
  end
end
