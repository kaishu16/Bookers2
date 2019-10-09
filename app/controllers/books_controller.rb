class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.new(params_book)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book)
    else
    @user = current_user
    @books = Book.select{|book| book.user_id == @user.id }
    render 'users/show'
    end
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = User.find(@book.user_id)
    @comment = BookComment.new
    @book_comment = BookComment.find_by(book_id: @book.id)
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
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params_book)
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      @user = User.find(@book.user_id)
      render :edit
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def params_book
    params.require(:book).permit(:title, :body)
  end

end
