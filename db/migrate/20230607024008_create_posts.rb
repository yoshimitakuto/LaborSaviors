class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :mental_status, null: false, default: 1
      t.boolean :is_resolution, null: false, default: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
