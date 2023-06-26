class Public::UsersController < ApplicationController
  before_action :find_id, except: [:index]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @users = User.page(params[:page]).per(12)
  end

  def post_likes
    post_likes = PostLike.where(user_id: @user.id).pluck(:post_id)
    @post_likes_posts = Post.where(id: post_likes).page(params[:page]).per(8).order(created_at: :desc)
  end

  def comment_likes
    comment_likes = CommentLike.where(user_id: @user.id).pluck(:post_comment_id)
    @comment_likes_comments = PostComment.where(id: comment_likes).page(params[:page]).per(8).order(created_at: :desc)
  end

  def my_posts
    @posts = Post.where(user_id: @user.id).page(params[:page]).per(8).order(created_at: :desc)
  end

  def my_post_comments
    @post_comments = PostComment.where(user_id: @user.id).page(params[:page]).per(8).order(created_at: :desc)
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

    # chartkickで現在から1週間前の記録を表示
    post_data = @user.posts.group_by_day(:created_at, range: 1.week.ago.midnight..Time.now.end_of_day).count
    post_comment_data = @user.post_comments.group_by_day(:created_at, range: 1.week.ago.midnight..Time.now.end_of_day).count
    comment_reply_data = @user.comment_replies.group_by_day(:created_at, range: 1.week.ago.midnight..Time.now.end_of_day).count
    @chart = [ { name: "お悩み投稿数", data: post_data }, { name: "救世コメント数", data: post_comment_data }, { name: "評価コメント数", data: comment_reply_data }, ]
    @post_count = @user.posts.count
    @post_comment_count = @user.post_comments.count
    @comment_reply_count = @user.comment_replies.count
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_show_path(@user.id), warning: "情報を更新しました。"
    else
      flash.now[:danger] = "情報を更新に失敗しました。もう一度お試しください。"
      render :edit
    end
  end

  def check
  end

  def withdraw
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, success: "退会しました。"
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image, :is_deleted, :level)
  end

  def find_id
    @user = User.find(params[:id])
  end

end
