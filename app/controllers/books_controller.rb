class BooksController < ApplicationController

  def create
   @book_new = Book.new(book_params)
   @book_new.user_id = current_user.id
   if @book_new.save
    flash[:create] = "You have created book successfully."
    redirect_to book_path(@book_new.id)
   else
      @user = current_user
      @books = Book.all
      render ("books/index")
   end
  end
  
  def update
  @book = Book.find(params[:id])
     if @book.update(book_params)
     flash[:update] = "You have updated book successfully."
     redirect_to book_path(@book)
     else
      @books = Book.find(params[:id]) 
      render :edit
     end
  end

  def index
  @books = Book.all
  @book_new = Book.new
  @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
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
