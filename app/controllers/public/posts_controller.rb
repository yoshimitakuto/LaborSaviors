class Public::PostsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update]

  def index
     # ransackでの検索機能
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(8)

    # 「is_resoulution」のステータスを簡単に記述するための記述
    @false = Post.where(is_resolution: false)
    @true = Post.where(is_resolution: true)

    @categories = Category.all

    # タグリンク検索のための記述
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}").page(params[:page]).per(8)
    end
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
    @post_comment = PostComment.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "編集が完了しました"
      redirect_to posts_path
    else
      flash[:notice] = "申し訳ございません。編集に失敗しました"
      render :edit
    end
  end

  def destroy
    if Post.find(params[:id]).destroy
      flash[:notice] = "削除しました"
      redirect_to posts_path
    else
      flash[:notice] = "削除に失敗しました"
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
