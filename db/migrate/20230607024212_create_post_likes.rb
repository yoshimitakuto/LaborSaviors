class CreatePostLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
