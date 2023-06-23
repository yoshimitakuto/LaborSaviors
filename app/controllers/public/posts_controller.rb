class Public::PostsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show, :category_search]

  def index
     # ransackでの検索機能
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(6).order(created_at: :desc)
    # @counts = @posts.total_count

    # 「is_resoulution」のステータスを簡単に記述するための記述
    @false = Post.where(is_resolution: false)
    @true = Post.where(is_resolution: true)

    @categories = Category.all

    # タグリンク検索のための記述
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}").page(params[:page]).per(6)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, success: "投稿に成功しました。救世コメントを待ちましょう！"
    else
      redirect_to request.referer, danger: "投稿に失敗しました。もう一度お試しください。"
    end
  end

  def category_search
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.page(params[:page]).per(6).order(created_at: :desc)
  end

  def show
    @post_comment = PostComment.new
    # ログイン中のユーザーの閲覧数のみしかカウントしないようし、ログインしていないユーザーが閲覧できるようにするため。
    if user_signed_in?
      unless ViewCount.find_by(user_id: current_user.id, post_id: @post.id)
        current_user.view_counts.create(post_id: @post.id)
      end
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, warning: "編集が完了しました。"
    else
      flash.now[:danger] = "編集に失敗しました。もう一度お試しください。"
      render :edit
    end
  end

  def destroy
    if Post.find(params[:id]).destroy
      redirect_to posts_path, danger: "投稿を削除しました。"
    else
      flash.now[:danger] = "削除に失敗しました。もう一度お試しください。"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:category_id, :mental_status, :is_resolution, :content, :tag_list)
  end

  def find_id
    @post = Post.find(params[:id])
  end

end
