class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user_book = Book.where(user_id: current_user.id)
    else
      @user_book = Book.where(user_id: params[:id])
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id == @user.id
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully!"
      redirect_to user_path
    else
      flash[:alert] = "The title is too short (minimum is 2 characters) or somewhere blank"
      render action: :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
