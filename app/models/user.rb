class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # ========アソシエーション設定========
  # 投稿機能
  has_many :posts, dependent: :destroy

  # 投稿ブックマーク機能
  has_many :post_likes, dependent: :destroy

  # コメント機能
  has_many :post_comments, dependent: :destroy

  # コメントブックマーク機能（ユーザー評価でも使用）
  has_many :comment_likes, dependent: :destroy
  # ========アソシエーション設定========



  # ========プロフィール画像用設定========
  has_one_attached :profile_image

  # 画像のサイズ・画像がなかったときの使用画像指定
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
   # ========プロフィール画像用設定========



  # ========バリデーション設定========
  validates :nickname, presence: true
  # ========バリデーション設定========

end
