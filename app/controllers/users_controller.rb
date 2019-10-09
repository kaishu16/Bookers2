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
    if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_user)
      flash[:notice] = "successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
