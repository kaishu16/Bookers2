class UsersController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
    @book = Book.new
    @books = Book.select{|book| book.user_id == @user.id }
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.select{|book| book.user_id == @user.id }
  end

  def index
    @user = current_user
    @users = User.all
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params_user)
    redirect_to user_path(@user)
  end

  private

  def params_user
    params.require(:user).permit(:name, :body, :profile_image)
  end

end
