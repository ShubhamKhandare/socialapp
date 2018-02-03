Rails.application.routes.draw do
  get 'messages/index' , to: 'messages#index'

  resources :hearts, :only => [:heart,:unheart]
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :users, :only => [:show, :index, :destroy] do
    member do
      get :following, :followers  
    end
  end
  
  resources :microposts,          only: [:create, :destroy,:show, :index]

  resources :relationships,       only: [:create, :destroy]

  resources :conversations,       only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

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
