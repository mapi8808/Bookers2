class SearchController < ApplicationController
  def search
    @user_or_book = params[:option]
    if @user_or_book == "1"
      @users = User.search(params[:search], params[:choice], @user_or_book )
    else
      @books = Book.search(params[:search], params[:choice], @user_or_book)
    end
  end
end
