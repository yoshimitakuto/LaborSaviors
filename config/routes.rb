Rails.application.routes.draw do

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
# =========deviceルーティング=========
# ユーザー用
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

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
    member do
      get 'my_index'
      get 'user_index'
      get 'bookmark_index'
    end
    resource :post_likes, only:[:create, :destroy]
    resources :post_comments, except:[:new, :show] do
      member do
        get 'my_index'
        get 'bookmark_index'
      end
      resource :comment_likes, only:[:create, :destroy]
    end
  end

  # users
  get  '/users'  => 'users#index'
  get  '/users/mypage' => 'users#mypage'
  get  '/users/:id' => 'users#show'
  get  '/users/information/edit' => 'users#edit'
  patch  '/users/information' => 'users#update'
  get  '/users/check' => 'users#check'
  patch  '/users/withdraw' => 'users#withdraw'
end



# 管理者側
namespace :admin do
  # homes
  get "/" => "homes#top"
  # posts, post_comments
  resources :posts, only: [:index,:show,:destroy] do
    resources :post_comments,only: [:index,:show,:destroy]
  end
  # categories
  resources :categories,except: [:new,:show]
  # users
  resources :users,only: [:index,:show,:edit,:update]
end
# =========一般ルーティング=========

end
