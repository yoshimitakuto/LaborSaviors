class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    post_comment = current_user.post_comments.new(post_comment_params)
    post_comment.post_id = @post.id
    post_comment.save
    flash.now[:success] = "コメント成功！お悩み投稿者があなたのおかげで救わることでしょう。"
    # userモデルに記述のあるレベルアップメソッドを利用
    current_user.check_level_up
    # 非同期通信のためリダイレクト先の指定なし
  end

  def edit
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
    if @post_comment.update(post_comment_params)
      redirect_to post_path(@post.id), warning: "コメント内容を更新しました。"
    else
      flash.now[:danger] = "コメントの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    flash.now[:danger] = "救世コメントを削除しました。"
    @post = Post.find(params[:post_id])
    # 非同期通信のためリダイレクト先の指定なし
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :evaluation)
  end

  def find_post_id
    @post = Post.find(params[:post_id])
  end

end
