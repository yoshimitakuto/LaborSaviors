class ChangeCommentRepliesToCommnetReplies < ActiveRecord::Migration[6.1]
  def change
    rename_table :commentReplies, :comment_replies
  end
end
