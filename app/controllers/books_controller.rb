class BooksController < ApplicationController
before_action :authenticate_user!, only: [:create, :update, :edit, :destroy]

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
  
  def update
  @book = Book.find(params[:id])
     if @book.update(book_params)
     flash[:update] = "You have updated book successfully ."
     redirect_to book_path(@book)
     else
      @book = Book.find(params[:id]) 
      render :edit
     end
  end

  def index
  @books = Book.all
  @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def edit
  @book = Book.find(params[:id]) 
  end
  
  def destroy
   book = Book.find(params[:id])
   if book.destroy
   redirect_to books_path
   end
  end 
  
  
  private
  def book_params
  params.require(:book).permit(:title, :body)
  end
end
