class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def my_index
  end

  def user_index
  end

  def bookmark_index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました。救世コメントを待ちましょう！"
      redirect_to posts_path
    else
      flash[:notice] = "申し訳ございません。投稿に失敗しました。"
      redirect_to request.referer
    end
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:category_id, :mental_status, :is_resolution, :content)
  end

end
