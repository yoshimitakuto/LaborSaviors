class Post < ApplicationRecord

   # ========タグ設定========
   acts_as_taggable_on :tags
   # ========タグ設定========



  # ========アソシエーション設定========
  # ユーザー間
  belongs_to :user

  #コメント機能
  has_many :post_comments, dependent: :destroy

  # 投稿のブックマーク機能
  has_many :post_likes, dependent: :destroy

  # カテゴリー機能
  belongs_to :category

  # 関連するNotificationインスタンスも一緒に削除するため記述
  has_one :notification, as: :subject, dependent: :destroy

  # 通知機能
  has_many :view_counts, dependent: :destroy
  # ========アソシエーション設定========



  # ========バリデーション設定========
  validates :content, presence: true, on: :publicize
  validates :is_resolution, inclusion: { in: [true, false] }, on: :publicize
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


  # ransackable_attributesメソッドで検索可能な属性のリストを定義（検索項目追加する場合はリストに追記）
  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "content", "created_at", "id", "is_resolution", "mental_status", "updated_at", "user_id"]
  end

end
