class CreateCommentLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post_comment, foreign_key: true, null: false
      t.decimal :evaluation, precision: 2, scale: 1

      t.timestamps
    end
  end
end
