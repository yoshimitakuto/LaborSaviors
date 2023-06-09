class Public::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def mypage
  end

  def show
  end

  def edit
  end

  def check
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image)
  end
end
