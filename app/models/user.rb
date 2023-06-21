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

  # コメント返信機能
  has_many :comment_replies

  # コメントブックマーク機能（ユーザー評価でも使用）
  has_many :comment_likes, dependent: :destroy

  # 通知機能
  has_many :notifications, dependent: :destroy

  # 通知機能
  has_many :view_counts, dependent: :destroy
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


   # is_deleted日本語化
   def deleted_status
     if is_deleted == false
       "会員"
     else
       "退会済み"
     end
   end


  # レベルアップのための確認メソッド（レベル表示は「user.level」）
   def check_level_up
     # ユーザーのコメント数を取得
     comment_count = post_comments.count

     # コメント数でレベルアップ条件を定義
      level_conditions = []
      # 闘値計算「例：(level(10) - 2 ) * 2 + 1 = comment_count_threshold(17)」
      (2..100).each do |level|
        comment_count_threshold = (level - 2) * 2 + 1
        condition = { level: level, comment_count: comment_count_threshold }
        level_conditions << condition
      end

      # レベルアップ条件をチェックし、条件を満たした場合はユーザーレベルを更新
      level_conditions.each do |condition|
        if comment_count >= condition[:comment_count] && level < condition[:level]
          update(level: condition[:level])
        end
      end
   end

end
