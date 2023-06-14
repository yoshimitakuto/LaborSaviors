class CommentReply < ApplicationRecord

  # ========アソシエーション設定========
  # コメント間
  belongs_to :post_comment

  # ユーザー間
  belongs_to :user
  # ========アソシエーション設定========



  # ========バリデーション設定========
  validates :reply_comment,  presence: true
  # ========バリデーション設定========

end
