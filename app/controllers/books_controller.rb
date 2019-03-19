class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.new(params_book)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = User.find(@book.user_id)
  end

  def index
    @newbook = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    if current_user.id != @user.id
      @newbook = Book.new
      render :show
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(params_book)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def params_book
    params.require(:book).permit(:title, :opinion)
  end

end
