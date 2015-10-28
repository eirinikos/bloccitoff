Rails.application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  post "log_in" => "sessions#create"
  get "log_out" => "sessions#destroy", :as =>"log_out"

  get "sign_up" => "users#new", :as => "sign_up"
  get "profile" => "users#show", :as => "profile"

  root to: "users#show"

  resources :users, except: [:show, :index] do
    resources :items, only: [:new, :create, :destroy]
  end

  resources :sessions
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :todos, only: [:new, :create, :show]
end
