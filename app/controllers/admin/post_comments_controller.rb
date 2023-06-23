class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.page(params[:page]).per(20)
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    if @post_comment.destroy
      redirect_to request.referer, success: "コメントを削除しました。"
    else
      flash.now[:danger] = "コメント削除が失敗しました。"
      render :index
    end
  end
end
