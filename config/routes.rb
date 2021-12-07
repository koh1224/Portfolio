Rails.application.routes.draw do
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about"

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'users#followings', as: 'followings'
    get 'followers' => 'users#followers', as: 'followers'
  end

  resources :ideas do
    resource :favorites, only: [:create, :destroy]
  end
  resources :genres

  get "search" => "ideas#search"

end
