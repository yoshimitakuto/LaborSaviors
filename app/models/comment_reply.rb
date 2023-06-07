class CommentReply < ApplicationRecord

  # ========アソシエーション設定========
  # コメント間
　belongs_to :post_comment
  # ========アソシエーション設定========



  # ========バリデーション設定========
  vaildates :reply_comment, presence: true
  # ========バリデーション設定========

end
