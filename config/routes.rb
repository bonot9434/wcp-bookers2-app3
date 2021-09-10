Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  root 'homes#top'
  get "/home/about" => "homes#about"
  get '/search' => 'searches#search'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  #グループ機能
  resources :groups do
    get "join" => "groups#join"
    #メール
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
end
