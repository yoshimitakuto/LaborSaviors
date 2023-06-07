class Category < ApplicationRecord

  # ========アソシエーション設定========
  # ユーザー間
  has_many :posts, dependent: :destroy
  # ========アソシエーション設定========



  # ========バリデーション設定========
  vaildates :name, presence: true
  # ========バリデーション設定========

end
