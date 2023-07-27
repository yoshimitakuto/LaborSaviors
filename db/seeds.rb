# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# -------------------本番用デモデータ-------------------------
# Admin Data
Admin.create!(
  email: 'admin@admin.com',
  password: 'adminadmin'
)

# User Data
users_attributes = [
    {email: 'oliva@example.com', nickname: "オリバ", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename: "sample-user1.jpg"), level: 1},
    {email: 'mecanick@example.com', nickname: "メカニック", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename: "sample-user2.jpg"), level: 1},
    {email: 'yosshi@example.com', nickname: "ヨッシ", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename: "sample-user3.jpg"), level: 1},
    {email: 'yopata@example.com', nickname: "よぱた", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename: "sample-user4.jpg"), level: 1},
    {email: 'butaro@example.com', nickname: "ブー太郎", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename: "sample-user5.jpg"), level: 1},
    {email: 'kitecchan@example.com', nickname: "きてっちゃん", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename: "sample-user6.jpg"), level: 1},
    {email: 'sciencemaster@example.com', nickname: "サイエンスマスター", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename: "sample-user7.jpg"), level: 1},
    {email: 'kotecchan@example.com', nickname: "こてっちゃん", password: 'password', is_deleted: true, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename: "sample-user8.jpg"), level: 1},
    {email: 'sacchan@example.com', nickname: "さっちゃん", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename: "sample-user9.jpg"), level: 1},
    {email: 'pisuke@example.com', nickname: "ピー助", password: 'password', is_deleted: true, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename: "sample-user10.jpg"), level: 1},
    {email: 'nodejs@example.com', nickname: "ノードジェイエス", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename: "sample-user11.jpg"), level: 1},
    {email: 'hatimitu@example.com', nickname: "蜂蜜", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename: "sample-user12.jpg"), level: 1},
    {email: 'luca@example.com', nickname: "Luca", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename: "sample-user13.jpg"), level: 1},
    {email: 'samurai@example.com', nickname: "サムライ", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user14.png"), filename: "sample-user14.jpg"), level: 1},
    {email: 'hosto@example.com', nickname: "ホスト", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user15.jpg"), filename: "sample-user15.jpg"), level: 1}
  ]

  users_attributes.map do |attribute|
    User.create!(attribute)
  end


# Category Data
category_names = %w(
    労働環境
    仕事内容
    人間関係
    その他
  )

category_names.map do |name|
  Category.create!(name: name)
end
# -------------------本番用デモデータ-------------------------





# -------------------開発段階用デモデータ-------------------------
# Admin.create!(
#   email: 'admin@admin.com',
#   password: 'adminadmin'
# )

# users_attributes = [
#     {email: 'oliva@example.com', nickname: "オリバ", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename: "sample-user1.jpg"), level: 1},
#     {email: 'mecanick@example.com', nickname: "メカニック", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename: "sample-user2.jpg"), level: 1},
#     {email: 'yosshi@example.com', nickname: "ヨッシ", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename: "sample-user3.jpg"), level: 1},
#     {email: 'yopata@example.com', nickname: "よぱた", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename: "sample-user4.jpg"), level: 1},
#     {email: 'butaro@example.com', nickname: "ブー太郎", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename: "sample-user5.jpg"), level: 1},
#     {email: 'kitecchan@example.com', nickname: "きてっちゃん", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename: "sample-user6.jpg"), level: 1},
#     {email: 'sciencemaster@example.com', nickname: "サイエンスマスター", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename: "sample-user7.jpg"), level: 1},
#     {email: 'kotecchan@example.com', nickname: "こてっちゃん", password: 'password', is_deleted: true, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename: "sample-user8.jpg"), level: 1},
#     {email: 'sacchan@example.com', nickname: "さっちゃん", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename: "sample-user9.jpg"), level: 1},
#     {email: 'pisuke@example.com', nickname: "ピー助", password: 'password', is_deleted: true, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename: "sample-user10.jpg"), level: 1},
#     {email: 'nodejs@example.com', nickname: "ノードジェイエス", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename: "sample-user11.jpg"), level: 1},
#     {email: 'hatimitu@example.com', nickname: "蜂蜜", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename: "sample-user12.jpg"), level: 1},
#     {email: 'luca@example.com', nickname: "Luca", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename: "sample-user13.jpg"), level: 1},
#     {email: 'samurai@example.com', nickname: "サムライ", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user14.png"), filename: "sample-user14.jpg"), level: 1},
#     {email: 'hosto@example.com', nickname: "ホスト", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user15.jpg"), filename: "sample-user15.jpg"), level: 1}
#   ]

# category_names = %w(
#     労働環境
#     仕事内容
#     人間関係
#     その他
#   )

# categories = category_names.map do |name|
#   Category.create!(name: name)
# end

# tag_list = %w(
#     tag1
#     tag2
#     tag3
#     tag4
#     tag5
#   )

# users_attributes.each do |attributes|
#   user = User.create!(attributes)
#   rand(1..3).times do
#     post = user.posts.build(
#       category_id: categories.sample.id,
#       content: "text " * rand(5..20)
#     )
#     post.tag_list = tag_list.sample(rand(0..tag_list.size))
#     post.save!
#   end
# end

# users = User.all.sample(10)
# posts = Post.where(id: (1..10))

# users.each do |user|
#   reject_current_user_posts = posts.select{ |o| o.id != user.id }
#   post = reject_current_user_posts.sample
#   comment = user.post_comments.create!(post_id: post.id,
#                             comment: "text " * rand(2..20),
#                             evaluation: [nil, 3, 4, 5].sample)
#   comment.comment_replies.create!(user_id: post.user_id,
#                                   reply_comment: "text " * rand(2..20)
#                                   ) if comment.evaluation
#   comment_count = user.post_comments.count
#   if comment_count >= 1
#     user.level += 1
#     user.save!
#   end
# end
# -------------------開発段階用デモデータ-------------------------
