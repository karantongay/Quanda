Rails.application.routes.draw do
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]
  get 'welcome/index'

  resources :questions do
  	resources :answers
  end

  resources :users do
  member do
    get :follow
    get :unfollow
  end
end

  resources :profiles

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end