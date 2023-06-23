class Admin::UsersController < ApplicationController
  before_action :find_id, except: [:index]
  before_action :authenticate_admin!

  def index
    # ゲストユーザーを謝って退会処理しないための処理
    @users = User.where.not(email: 'guest@example.com').page(params[:page]).per(20)
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, warning: "会員情報を更新しました。"
    else
      flash.now[:danger] = "会員情報の更新に失敗しました。"
      render :show
    end

  end


  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image, :is_deleted)
  end

  def find_id
    @user = User.find(params[:id])
  end

end
