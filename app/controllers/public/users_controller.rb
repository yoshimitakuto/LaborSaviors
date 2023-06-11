class Public::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def mypage
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def check
    @user = User.find(params[:id])
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image)
  end

end
