Rails.application.routes.draw do


# =========deviceルーティング=========
# ユーザー用
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# ゲストログイン用
devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
end

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
# =========deviceルーティング=========



# =========一般ルーティング=========
# ユーザー側
scope module: :public do
  # homes
  root to: 'homes#top'
  get '/about' => 'homes#about'

  # posts, post_likes, post_comments,  comment_likes
  resources :posts do
    resource :post_likes, only:[:create, :destroy]
    resources :post_comments, except:[:new, :show] do
      resource :comment_likes, only:[:create, :destroy]
      resources :comment_replies, only:[:create, :destroy]
    end
  end

  # users
  get  '/users'  => 'users#index'
  get '/users/:id/my_posts' => 'users#my_posts', as: 'user_my_posts'
  get '/users/:id/post_likes' => 'users#post_likes', as: 'user_post_likes'
  get '/users/:id/my_post_comments' => 'users#my_post_comments', as: 'user_my_post_comments'
  get '/users/:id/comment_likes' => 'users#comment_likes', as: 'user_comment_likes'
  get  '/users/mypage' => 'users#mypage', as: 'mypage'
  get  '/users/:id' => 'users#show', as: 'user_show'
  get  '/users/information/edit' => 'users#edit'
  patch  '/users/information' => 'users#update'
  get  '/users/:id/check' => 'users#check', as: 'check'
  patch  '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
end



# 管理者側
namespace :admin do
  # homes
  get "/" => "homes#top"
  # posts, post_comments
  resources :posts, only: [:index,:show,:destroy]
  resources :post_comments,only: [:index,:show,:destroy]
  # categories
  resources :categories,except: [:new,:show]
  # users
  resources :users,only: [:index,:show,:edit,:update]
end
# =========一般ルーティング=========

end
