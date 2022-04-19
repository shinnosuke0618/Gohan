Rails.application.routes.draw do

 #会員用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  }

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  #ゲストログイン用
 


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

    resources :posts do
     resources :reviews, only: [:index, :create]
    end
    resources :genres, only: [:index, :show]
    
    post 'customer/guest_sign_in', to: 'customers/sessions#guest_sign_in'

    resource "customers", path: 'customers/my_page', only: [:edit, :show, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
  end

end
