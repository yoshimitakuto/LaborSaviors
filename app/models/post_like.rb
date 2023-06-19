class PostLike < ApplicationRecord

  # ========アソシエーション設定========
  # ユーザー間
  belongs_to :user

  # 投稿間
  belongs_to :post

  # 通知機能間（subjectがPostLikeモデルとなる）
  # 一つの事柄に対応した一つの通知を取り出すのみのため「has_one」で設定
  has_one :notification, as: :subject, dependent: :destroy
  # ========アソシエーション設定========



  # アクション後に通知を受け取るため、モデルのインスタンスが作成された後に実行
  after_create_commit :create_notifications


  private

  def create_notifications
    Notification.create(subject: self, user: self.post.user, action_type: :liked_to_own_post)
  end

end
