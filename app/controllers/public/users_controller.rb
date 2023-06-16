class Public::UsersController < ApplicationController
  before_action :find_id, except: [:index]

  def index
    @users = User.all
  end

  def post_likes
    post_likes = PostLike.where(user_id: @user.id).pluck(:post_id)
    @post_likes_posts = Post.find(post_likes)
  end

  def comment_likes
    comment_likes = CommentLike.where(user_id: @user.id).pluck(:post_comment_id)
    @comment_likes_comments = PostComment.find(comment_likes)
  end

  def my_posts
    @posts = Post.where(user_id: @user.id)
  end

  def my_post_comments
    @post_comments = PostComment.where(user_id: @user.id)
  end

  def show
    # 投稿に対していいねを獲得した総数
    @user_posts = @user.posts
    @post_likes_count = 0
    @user_posts.each do |post|
      @post_likes_count += post.post_likes.count
    end

    # コメントに対していいねを獲得した総数
    @user_post_comments = @user.post_comments
    @comment_likes_count = 0
    @user_post_comments.each do |post_comment|
      @comment_likes_count += post_comment.comment_likes.count
    end

  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "情報を更新しました"
      redirect_to user_show_path(@user.id)
    else
      flash[:notice] = "情報を更新に失敗しました"
      render :edit
    end
  end

  def check
  end

  def withdraw
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image)
  end

  def find_id
    @user = User.find(params[:id])
  end

end
