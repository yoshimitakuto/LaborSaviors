class ChangeCommentRepliesToCommnetReplies < ActiveRecord::Migration[6.1]
  def change
    rename_table :commentReplies, :commnet_replies
  end
end
