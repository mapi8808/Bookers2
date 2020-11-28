class BooksController < ApplicationController

  def index
  @books = Book.all
  # @books?
  end

  def show
    @book = Book.find(params[:id])
  end

end

 
 