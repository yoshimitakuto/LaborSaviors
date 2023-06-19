class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.page(params[:page]).per(20)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "コメントを削除しました"
      redirect_to request.referer
    else
      flash[:notice] = "コメント削除が失敗しました"
      render :index
    end
  end
end
