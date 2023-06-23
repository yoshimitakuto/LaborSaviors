class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.order(created_at: :desc).page(params[:page]).per(10)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end

  def destroy
    @notifications = current_user.notifications.destroy_all
    redirect_to notifications_path, warning: "通知を全て削除しました。"
  end

end
