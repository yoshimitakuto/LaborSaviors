class CreateCommentReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :commentReplies do |t|
      t.belongs_to :post_comment, foreign_key: true
      t.text :reply_comment, null: false

      t.timestamps
    end
  end
end
