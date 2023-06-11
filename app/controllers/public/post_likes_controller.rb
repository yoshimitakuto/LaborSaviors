class Public::PostLikesController < ApplicationController
  before_action :find_post_id

  def create
    @post_like = current_user.post_likes.new(post_id: @post.id)
    @post_like.save
    redirect_to request.referer
  end

  def destroy
    @post_like = current_user.post_likes.find_by(post_id: @post.id)
    @post_like.destroy
    redirect_to request.referer
  end

  private

  def find_post_id
    @post = Post.find(params[:post_id])
  end

end
