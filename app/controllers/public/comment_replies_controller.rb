class Public::CommentRepliesController < ApplicationController

  def create
    # viewで変数を使用する場面がないためローカル変数で記述
    post = Post.find(params[:post_id])
    post_comment = post.post_comments.find(params[:post_comment_id])
    comment_reply = post_comment.comment_replies.new(comment_reply_params)
    comment_reply.user_id = post.user_id

    if comment_reply.save
      # updateを用いて、post_commentテーブルの「evaluation」カラムへcomment_replyのformからデータを送信
      post_comment.update(evaluation: params[:evaluation])
      redirect_to request.referer
    else
      flash[:notice] = "コメント返信が正常に動作しませんでした。"
      redirect_to request.referer
    end
  end

  def destroy
    CommentReply.find(params[:id]).destroy
    flash[:notice] = "コメント返信を削除しました。"
    redirect_to request.referer
  end

  private

  def comment_reply_params
      params.require(:comment_reply).permit(:reply_comment, :post_comment_id, :user_id)
  end

end
