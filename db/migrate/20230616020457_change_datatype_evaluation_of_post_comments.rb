class ChangeDatatypeEvaluationOfPostComments < ActiveRecord::Migration[6.1]
  def change
    change_column :post_comments, :evaluation, :integer
  end
end
