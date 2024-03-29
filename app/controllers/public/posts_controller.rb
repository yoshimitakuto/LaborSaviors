class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :category_search]
  before_action :correct_post, only: [:edit, :update]

  def index
     # ransackでの検索機能
    @q = Post.ransack(params[:q])
    @posts = @q.result.where.not(is_draft: true).includes(:user).page(params[:page]).per(6).order(created_at: :desc)
    @total_counts = @posts.total_count

    # 「is_resoulution」のステータスをview側で簡単に記述するための記述(下書き内容も反映)
    @false = Post.where("is_resolution=? and is_draft=?",false, false)
    @true = Post.where("is_resolution=? and is_draft=?",true, false)

    @categories = Category.all

    # タグリンク検索のための記述
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}").where.not(is_draft: true).page(params[:page]).per(6)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if params[:draft].present?
      if @post.update(is_draft: true)
        redirect_to user_draft_posts_path(current_user), warning: "お悩みを下書き保存しました。"
      else
        flash.now[:danger] = "下書き保存に失敗しました。お手数ですがカテゴリのみ選択してもう一度お試しください。"
        render 'new'
      end
    else
      if @post.save(context: :publicize)
        redirect_to posts_path, success: "投稿に成功しました。救世コメントを待ちましょう！"
      else
        # flash.now[:danger] = "投稿に失敗しました。タグ以外の項目を入力しもう一度お試しください。"
        render 'new'
      end
    end
  end

  def category_search
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.where.not(is_draft: true).page(params[:page]).per(6).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    # 下書き投稿にURLから遷移できないように設定
    if @post.is_draft == true && @post.user_id != current_user.id
      redirect_to posts_path
    end
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
    # 下書きしたお悩み投稿内容を公開（投稿）する場合
    if params[:publicize_draft]
      @post.attributes = post_params.merge(is_draft: false)
      if @post.save(context: :publicize)
        redirect_to posts_path, warning: "下書きしたお悩みの投稿が完了しました。"
      else
        @post.is_draft = true
        redirect_to request.referer, danger: "下書きを投稿できませんでした。お手数ですが再度お試しください。"
      end
    # 公開済みのお悩み投稿を更新する場合
    elsif params[:commit]
      @post.attributes = post_params
      if @post.save(context: :publicize)
        redirect_to posts_path, warning: "編集が完了しました。"
      else
        redirect_to request.referer, danger: "編集に失敗しました。項目を全て入力してからもう一度お試しください。"
      end
    # 下書きお悩み投稿の更新（非公開）の場合
    else
      if @post.update(post_params)
        redirect_to post_path(@post), warning: "下書き内容を更新しました。"
      else
        redirect_to request.referer, danger: "下書き内容の更新に失敗しました。お手数ですがカテゴリを選択してもう一度お試しください。"
      end
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
    params.require(:post).permit(:category_id, :mental_status, :is_resolution, :content, :tag_list, :is_draft)
  end

  def correct_post
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to posts_path
    end
  end

end
