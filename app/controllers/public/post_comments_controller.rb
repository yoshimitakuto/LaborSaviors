class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.save
    redirect_to request.referer
  end

  def edit
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
    if @post_comment.update(post_comment_params)
      flash[:notice] = "コメントが更新されました。"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "コメントの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to request.referer
    @post = Post.find(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

  def find_post_id
    @post = Post.find(params[:post_id])
  end

end
