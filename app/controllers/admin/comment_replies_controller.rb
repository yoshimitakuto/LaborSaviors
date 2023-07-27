class Admin::CommentRepliesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comment_replies = CommentReply.includes(:user).page(params[:page]).per(20)
  end

  def destroy
    @comment_reply = CommentReply.find(params[:id])
    if @comment_reply.destroy
      redirect_to request.referer, success: "返信コメントを削除しました。"
    else
      flash.now[:danger] = "返信コメント削除が失敗しました。"
      render :index
    end
  end

end
