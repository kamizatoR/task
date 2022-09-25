class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def show
    @book_new = Book.new
    
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      redirect_to root_path
    end
  end
  
  private 
  
   def book_params
      params.require(:book).permit(:title, :opinion)
   end
  
end
