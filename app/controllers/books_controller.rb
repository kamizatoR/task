class BooksController < ApplicationController
  def index
    @book_new = Book.new
    @user = current_user
    @books =Book.all

  end

  def show
    @book_new = Book.new

    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit

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
