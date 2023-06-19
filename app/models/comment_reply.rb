class CommentReply < ApplicationRecord

  # ========アソシエーション設定========
  # コメント間
  belongs_to :post_comment

  # ユーザー間
  belongs_to :user

  # 通知機能間（subjectがCommentReplyモデルとなる）
  # 一つの事柄に対応した一つの通知を取り出すのみのため「has_one」で設定
  has_one :notification, as: :subject, dependent: :destroy
  # ========アソシエーション設定========



  # アクション後に通知を受け取るため、モデルのインスタンスが作成された後に実行
  after_create_commit :create_notifications



  # ========バリデーション設定========
  validates :reply_comment,  presence: true
  # ========バリデーション設定========



  private

  def create_notifications
    Notification.create(subject: self, user: self.post_comment.user, action_type: :commented_to_own_post_comment)
  end

end
