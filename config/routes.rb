Rails.application.routes.draw do

  namespace :public do
    get 'genres/index'
    get 'genres/show'
  end
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  #会員用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  #管理者側ルーティング
  namespace :admin do
    resources :posts, only: [:index, :show, :edit, :update, :destory]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
   end

   #会員側ルーティング
   scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"

    resources :posts
    resources :genres, only: [:index, :show]

    resource "customers", only: [:edit, :show, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
  end

end
