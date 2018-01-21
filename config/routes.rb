Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :users, :only => [:show, :index, :destroy] do
    member do
      get :following, :followers
    end
  end
  
  resources :microposts,          only: [:create, :destroy]

  resources :relationships,       only: [:create, :destroy]

  root to: 'pages#index'

  get '/home',    to: 'pages#home'

  get '/help',    to: 'pages#help'

  get '/about',   to: 'pages#about'

  get '/contact', to: 'pages#contact'

end
