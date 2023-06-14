class Public::HomesController < ApplicationController

  def top
    # 「with_attached_profile_image」によりプロフィール画像の取得を高速化
    @users = User.with_attached_profile_image.limit(10)

    # 全投稿の投稿内容検索機能
    @q = Post.ransack(params[:q])
    @new_posts = @q.result.includes(:user).limit(5).order(created_at: :DESC)
  end

  def about
  end
end
