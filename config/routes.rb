Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "application#welcome"
  get "/home" => "application#home", as: "homepage"
  get "/auth/facebook/callback" => "sessions#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  post "/logout" => "sessions#destroy"
  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :movies, only: [:show, :index, :new, :create, :update, :destroy]
  end
  resources :genres, only: [:index, :show]
end
