Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :users, only: %i[show edit update]

  resources :posts, only: %i[index show create destroy] do
    resources :photos, only: %i[create]
  end
end
