class Public::PostLikesController < ApplicationController
  before_action :find_post_id

  def create
    @post_like = current_user.post_likes.new(post_id: @post.id)
    @post_like.save
    flash.now[:warning] = "共感しました！後で見返すことができます。"
    # 非同期通信のためリダイレクト先の指定なし
  end

  def destroy
    @post_like = current_user.post_likes.find_by(post_id: @post.id)
    @post_like.destroy
    flash.now[:danger] = "共感を外しました。"
    # 非同期通信のためリダイレクト先の指定なし
  end

  private

  def find_post_id
    @post = Post.find(params[:post_id])
  end

end
