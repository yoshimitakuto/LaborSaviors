class Public::HomesController < ApplicationController

  def top
    # post_commentsテーブルのevaluationカラムの値を元にしたランキング機能
    @rank = User.find(PostComment.group(:user_id).order('AVG(post_comments.evaluation) DESC').limit(10).pluck(:user_id))

    # ＜内訳＞　※念の為記載
    # PostComment.group(:user_id) でPostCommentモデルにある同じユーザーIDごとにグループ化。
    # order('AVG(post_comments.evaluation)')で、post_commentsテーブルのevaluationカラムの平均値を計算し、降順へと変換
    # pluck(user_id)でuser_idの数値を取得。


    # 全投稿の投稿内容検索機能
    @q = Post.ransack(params[:q])
    @new_posts = @q.result.includes(:user).limit(5).order(created_at: :DESC)
  end

  def about
  end
end
