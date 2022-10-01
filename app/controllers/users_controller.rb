class UsersController < ApplicationController
  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end

  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:notice] = "You have updated user successfully."
         redirect_to user_path(@user.id)
      else
        render :edit
      end
  end

  def show
    @book_new = Book.new
    @book = Book.new

    @user = User.find(params[:id])
    @books = @user.books
  end

  private

   def book_params
      params.require(:book).permit(:title, :body)
   end

   def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
   end

end
