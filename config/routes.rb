Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'residences/search' => 'residences#search'

  post 'messages/reply' => 'messages#reply'

  resources :sessions, only:[:create, :destroy]
  resources :users, except: [:index] do
    resources :messages, only: [:new, :create, :destroy]
    resources :availabilities, only: [:create, :destroy]
    resources :requests, only: [:show, :index]
  end

  resources :residences do
    resources :images, only:[:new, :create, :destroy]
    resources :requests, only: [:create, :destroy]
  end

  resources :pairings, only: [:create] do
    resources :shoutouts, only: [:new, :create, :destroy]
  end

  # You can have the root of your site routed with "root"
  root 'sessions#new'
end
