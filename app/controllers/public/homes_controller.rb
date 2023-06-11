class Public::HomesController < ApplicationController
  def top
    @users = User.all.limit(10)
    # 新着5件を表示
    @new_posts = Post.limit(5).order(created_at: :DESC)
  end

  def about
  end
end
