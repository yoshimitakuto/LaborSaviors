class Users::SessionsController < Devise::SessionsController

  # 新たにゲストログイン用のメソッドを作成
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, success: "ゲストでログインしました。"
  end

end