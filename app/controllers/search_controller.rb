class SearchController < ApplicationController
  def search
    @users = Users.search(params[:search])
    @books = Books.search(params[:search])
    @tasks = @tasks.where('title LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end
end
