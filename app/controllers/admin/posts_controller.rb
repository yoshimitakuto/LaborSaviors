class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.page(params[:page]).per(10)
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
