class Notification < ApplicationRecord

  # ========アソシエーション設定========
  # 各モデル間
  belongs_to :subject, polymorphic: true

  # ユーザー間
  belongs_to :user
  # ========アソシエーション設定========



  # enum設定（Notificationインスタンスの状態を判断するため）
  enum action_type: { commented_to_own_post: 0, liked_to_own_post: 1, commented_to_own_post_comment: 2, liked_to_own_post_comment: 3 }



end
