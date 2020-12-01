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
  
  def update
  @user = User.find(params[:id])
     if @user.update(user_params)
     flash[:update] = "You have updated user successfully."
     redirect_to user_path(@user)
     else
      @user = User.find(params[:id]) 
      render :edit
     end
  end

  def index
  @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    
  end
  
  def edit
  @book = Book.find(params[:id]) 
  end
  
  def destroy
   book = Book.find(params[:id])
   if book.destroy
   flash[:destroy] = "Book was successfully destroyed."
   redirect_to books_path
   end
  end 
  
  
  private
  def book_params
  params.require(:book).permit(:title, :body)
  end
end
