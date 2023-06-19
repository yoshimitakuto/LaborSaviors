# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin Data
Admin.create!(
  email: 'admin@admin.com',
  password: 'adminadmin'
)


# User Data
users = User.create! (
  [
    {email: 'oliva@example.com', nickname: "オリバ", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename: "sample-user1.jpg")},
    {email: 'mecanick@example.com', nickname: "メカニック", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename: "sample-user2.jpg")},
    {email: 'yosshi@example.com', nickname: "ヨッシ", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename: "sample-user3.jpg")},
    {email: 'yopata@example.com', nickname: "よぱた", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename: "sample-user4.jpg")},
    {email: 'butaro@example.com', nickname: "ブー太郎", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename: "sample-user5.jpg")},
    {email: 'kitecchan@example.com', nickname: "きてっちゃん", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename: "sample-user6.jpg")},
    {email: 'sciencemaster@example.com', nickname: "サイエンスマスター", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename: "sample-user7.jpg")},
    {email: 'kotecchan@example.com', nickname: "こてっちゃん", password: 'password', is_deleted: true, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename: "sample-user8.jpg")},
    {email: 'sacchan@example.com', nickname: "さっちゃん", password: 'password', is_deleted: false, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename: "sample-user9.jpg")},
    {email: 'pisuke@example.com', nickname: "ピー助", password: 'password', is_deleted: true, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename: "sample-user10.jpg")},
    {email: 'nodejs@example.com', nickname: "ノードジェイエス", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename: "sample-user11.jpg")},
    {email: 'hatimitu@example.com', nickname: "蜂蜜", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename: "sample-user12.jpg")},
    {email: 'luca@example.com', nickname: "Luca", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename: "sample-user13.jpg")},
    {email: 'samurai@example.com', nickname: "サムライ", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user14.png"), filename: "sample-user14.jpg")},
    {email: 'hosto@example.com', nickname: "ホスト", password: 'password', is_deleted: false,  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user15.jpg"), filename: "sample-user15.jpg")}
  ]
)

# Category Data
Category.create!(name: '労働環境')
Category.create!(name: '仕事内容')
Category.create!(name: '人間関係')
Category.create!(name: 'その他')
