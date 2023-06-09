class Post < ApplicationRecord

  # ========アソシエーション設定========
  # ユーザー間
  belongs_to :user

  #コメント機能
  has_many :post_comments, dependent: :destroy

  # 投稿のブックマーク機能
  has_many :post_likes, dependent: :destroy

  # カテゴリー機能
  belongs_to :category
  # ========アソシエーション設定========



  # ========バリデーション設定========
  validates :category_id, :content, :mental_status, presence: true
  validates :is_resolution, inclusion: { in: [true, false] }
  # ========バリデーション設定========



  # 投稿ブックマークの存在確認
  def post_likes_by?(user)
    post_likes.exists?(user_id: user.id)
  end

end
