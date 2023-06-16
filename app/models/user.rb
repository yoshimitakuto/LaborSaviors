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

  has_many :comment_replies

  # コメントブックマーク機能（ユーザー評価でも使用）
  has_many :comment_likes, dependent: :destroy
  # ========アソシエーション設定========



  # ========バリデーション設定========
  #一意性をアプリ側で持たせ、同時に同じ名前で新規登録された時に同じニックネームを登録させないようにするために、userモデル側でも一意性設定。
  validates :nickname, presence: true
  validates :is_deleted, inclusion: { in: [true, false] }
  # ========バリデーション設定========



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



   # ========ゲストログイン設定========
   def self.guest
     find_or_create_by!(nickname: 'guestuser' ,email: 'guest@example.com') do |user|
       user.password = SecureRandom.urlsafe_base64
     end
   end
   # ========ゲストログイン設定========



   # ========退会済みユーザーがログイン制御設定========
   def active_for_authentication?
     super && (is_deleted == false)
   end
   # ========退会済みユーザーがログイン制御設定========

   def top_rated(limit = 10)
     joins(:post_comments)
      .group(:id)
      .order('AVG(post_comments.evaluation) DESC')
      .limit(limit)
   end

end
