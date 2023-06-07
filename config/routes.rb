Rails.application.routes.draw do
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :admin do
    get 'categories/index'
    get 'categories/edit'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'tags/index'
  end
# ユーザー用
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

end
