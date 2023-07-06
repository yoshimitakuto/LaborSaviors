class AddIsDraftToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_draft, :boolean, null: false, default: false
  end
end
