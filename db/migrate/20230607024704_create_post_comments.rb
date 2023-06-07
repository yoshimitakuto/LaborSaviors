class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.text :comment, null: false
      t.decimal :evaluation, precision: 2, scale: 1

      t.timestamps
    end
  end
end
