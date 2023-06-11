class CommentLike < ApplicationRecord

  # ========アソシエーション設定========
  # ユーザー間
  # belongs_to :user

  # コメント間
  belongs_to :post_comment
  # ========アソシエーション設定========

end
