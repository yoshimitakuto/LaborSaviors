class PostLike < ApplicationRecord

  # ========アソシエーション設定========
  # ユーザー間
  belongs_to :user

  # 投稿間
　belongs_to :post
  # ========アソシエーション設定========

end
