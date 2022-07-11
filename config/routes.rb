Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :users, only: %i[show edit update]

  resources :posts, only: %i[index show create destroy] do
    resources :photos, only: %i[create]
    resources :likes, only: %i[create destroy], shallow: true
    resources :comments, only: %i[index create destroy], shallow: true
    resources :bookmarks, only: %i[create destroy], shallow: true
  end
end
