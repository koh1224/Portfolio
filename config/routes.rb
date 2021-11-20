Rails.application.routes.draw do
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about"

  resources :users
  resources :ideas
  resources :genres


end
