class PostComment < ApplicationRecord

  # ========アソシエーション設定========
  # ユーザー間
  belongs_to :user

  # 投稿間
  belongs_to :post

  # コメントのブックマーク機能
  has_many :comment_likes, dependent: :destroy

  # コメント返信機能
  has_many :comment_replies, dependent: :destroy

  # 通知機能間（subjectがPostCommentモデルとなる）
  # 一つの事柄に対応した一つの通知を取り出すのみのため「has_one」で設定
  has_one :notification, as: :subject, dependent: :destroy
  # ========アソシエーション設定========



  # アクション後に通知を受け取るため、モデルのインスタンスが作成された後に実行
  after_create_commit :create_notifications



  # ========バリデーション設定========
  validates :comment, presence: true
  # ========バリデーション設定========


  # コメントブックマークの存在確認（モデルないで呼び出す必要がないためprivateの外に配置）
  def comment_likes_by?(user)
    comment_likes.exists?(user_id: user.id)
  end



  private

  def create_notifications
    Notification.create(subject: self, user: post.user, action_type: :commented_to_own_post)
  end

end
