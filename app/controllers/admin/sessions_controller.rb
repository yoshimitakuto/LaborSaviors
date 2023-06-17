# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params,  if: :devise_controller?

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

  # protected

  # ログイン後はトップ画面へ遷移
  def after_sign_in_path_for(resource)
    admin_users_path
  end

  # サインアウト後はログイン画面へ遷移
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end


  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
