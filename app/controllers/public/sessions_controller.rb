# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params,  if: :devise_controller?
  before_action :user_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def after_sign_in_path_for(resource)
    flash[:success] = "ようこそ「#{@user.nickname}」さん！"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:success] = "ログアウトしました。"
    root_path
  end

  protected

  # 退会していることを判断するためのメソッド
  def user_state
    # ユーザーの登録されたemailを取得
    @user = User.find_by(nickname: params[:user][:nickname])
    # アカウント取得失敗の場合はメソッド強制終了
    return if !@user
    # 取得したアカウントのパスワードとに入力されたパスワードの一致確認 && ユーザー
    if @user.valid_password?(params[:user][:password]) && ( @user.is_deleted == true )
      redirect_to new_user_registration_path, warning: "退会済みです。再度ご登録してご利用ください。"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
