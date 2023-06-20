class Category < ApplicationRecord

  # ========アソシエーション設定========
  # 投稿間
  has_many :posts, dependent: :destroy
  # ========アソシエーション設定========



  # ========バリデーション設定========
  validates :name, presence: true
  # ========バリデーション設定========

end
