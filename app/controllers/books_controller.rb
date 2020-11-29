class BooksController < ApplicationController

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
  if @book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book.id)
  else
      @books = Book.all
      render ("books/index")
  end
  end

  def index
  @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    
  end
  
  private
  def book_params
  params.require(:book).permit(:title, :body)
  end
end