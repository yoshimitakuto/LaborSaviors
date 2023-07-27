class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    # 下書き中の投稿以外を表示
    @posts = Post.where.not(is_draft: true).includes(:user).page(params[:page]).per(10).order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to request.referer, success: "投稿を削除しました。"
    else
      flash.now[:danger] = "投稿削除に失敗しました。"
      render :index
    end
  end
end
