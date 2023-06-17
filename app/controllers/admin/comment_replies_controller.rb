class Admin::CommentRepliesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comment_replies = CommentReply.page(params[:page]).per(20)
  end

  def destroy
    @comment_reply = CommentReply.find(params[:id])
    if @comment_reply.destroy
      flash[:notice] = "返信コメントを削除しました"
      redirect_to request.referer
    else
      flash[:notice] = "返信コメント削除が失敗しました"
      render :index
    end
  end

end
