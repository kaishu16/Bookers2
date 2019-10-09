class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @user = User.find(@book.user_id)
    @book_comment = BookComment.new(params_book_comment)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @book.id
    @book_comment.save
    redirect_to book_path(@book)
  end

  def edit
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find_by(book_id: params[:book_id])
  end

  def update
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find_by(book_id: params[:book_id])
    @book_comment.update(params_book_comment)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:book_id])
    book_comment = BookComment.find_by(book_id: params[:book_id])
    book_comment.destroy
    redirect_to book_path(book)
  end

  private
  def params_book_comment
    params.require(:book_comment).permit(:user_id, :book_id, :comment)
  end
end
