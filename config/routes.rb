Bright::Application.routes.draw do

  root to: 'home#index'

  devise_for :users

  resources :users

  resources :categories

  resources :assets

  resources :copies

  resources :memberships

  resources :members

  resources :addresses

  resources :issues do
    patch :cancel, :close
  end

  resources :reservations do
    patch :cancel, :close
  end

  resources :rules

  resources :reports, only: [:index, :show]

end
