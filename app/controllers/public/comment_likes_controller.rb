class Public::CommentLikesController < ApplicationController
  before_action :find_post_comment_id

  def create
    @comment_like = current_user.comment_likes.new(post_comment_id: @post_comment.id)
    @comment_like.save
    flash.now[:success] = "高評価しました！後から見返すことができます。"
    # 非同期通信のためリダイレクト先の指定なし
  end

  def destroy
    @comment_like = current_user.comment_likes.find_by(post_comment_id: @post_comment.id)
    @comment_like.destroy
    flash.now[:danger] = "高評価を外しました。"
    # 非同期通信のためリダイレクト先の指定なし
  end

  private

  def find_post_comment_id
    @post_comment = PostComment.find(params[:post_comment_id])
  end

end
