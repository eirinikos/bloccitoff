Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'

  get "log_in" => "sessions#new", :as => "log_in"
  post "log_in" => "sessions#create"
  get "log_out" => "sessions#destroy", :as =>"log_out"

  get "sign_up" => "users#new", :as => "sign_up"
  get "users_show" => "users#show"
  root :to => "users#new"

  resources :users, except: [:show]

  resources :sessions

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :todos, only: [:new, :create, :show]
end
