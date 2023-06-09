class PostComment < ApplicationRecord

  # ========アソシエーション設定========
  # ユーザー間
  belongs_to :user

  # 投稿間
  belongs_to :post

  # コメントのブックマーク機能
  has_many :comment_likes, dependent: :destroy


  has_one :commnet_reply
  # ========アソシエーション設定========



  # ========バリデーション設定========
  vaildates :comment, presence: true
  # ========バリデーション設定========


  # コメントブックマークの存在確認
  def comment_likes_by?(user)
    comment_likes.exists?(user_id: user.id)
  end

end
