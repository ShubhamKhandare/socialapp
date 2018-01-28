Rails.application.routes.draw do
  resources :hearts, :only => [:heart,:unheart]
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :users, :only => [:show, :index, :destroy] do
    member do
      get :following, :followers  
    end

  end
  
  resources :microposts,          only: [:create, :destroy,:show]

  resources :relationships,       only: [:create, :destroy]

  root to: 'pages#index'

  get '/home',    to: 'pages#home'

  get '/help',    to: 'pages#help'

  get '/about',   to: 'pages#about'

  get '/contact', to: 'pages#contact'

  # post '/ajax_page', to: 'pages#test'

  get :search, controller: :pages 
  # get :autocomplete, controller: :pages

  match 'heart', to: 'hearts#heart', via: :post

  match 'unheart', to: 'hearts#unheart', via: :post


end
