class UsersController < ApplicationController


  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

 def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="User was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
      flash[:alret] = "投稿に失敗しました。"
    end

 end

  private

  def user_params
  	params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
