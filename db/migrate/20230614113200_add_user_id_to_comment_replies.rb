class AddUserIdToCommentReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :comment_replies, :user_id, :integer
  end
end
