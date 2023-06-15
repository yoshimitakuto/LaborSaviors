class Public::HomesController < ApplicationController

  def top
    # 「with_attached_profile_image」によりプロフィール画像の取得を高速化
    @users = User.all
    # @user_post_comments = @users.post_comment
    # @users_evaluation_count = 0
    # @user_post_comments.each do |post_comment|
    #   @users_evaluation_count += post_comment.evaluation.count
    # end

    # 全投稿の投稿内容検索機能
    @q = Post.ransack(params[:q])
    @new_posts = @q.result.includes(:user).limit(5).order(created_at: :DESC)
  end

  def about
  end
end
