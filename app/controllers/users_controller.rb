class UsersController < ApplicationController
  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
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

   def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
   end

end
