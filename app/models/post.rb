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
  validates :category_id, :content, presence: true
  validates :is_resolution, inclusion: { in: [true, false] }
  # ========バリデーション設定========



  # ========enum設定========
  enum mental_status: { tofu_mental: 0, konnyaku_mental: 1, hagane_mental: 2 }
  # ========enum設定========



  # 投稿ブックマークの存在確認
  def post_likes_by?(user)
    post_likes.exists?(user_id: user.id)
  end


  # メンタルステータス日本語化メソッド
  def mental
    mental_status_i18n
  end


  # is_resolution日本語化
  def resolution_status
    if is_resolution == false
      "未解決"
    else
      "解決済み"
    end
  end


end
