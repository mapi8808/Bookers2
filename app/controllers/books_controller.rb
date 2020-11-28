class BooksController < ApplicationController

  def index
  @books = Book.all
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
  end
  
  def create
   @book = Book.new(books_params)
   if @book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book.id)
   else
      @books = Book.all
      render ("books/index")
   end
  end
end