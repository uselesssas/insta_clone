Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users, only: %i[show edit update]
  post '/users/:id/follow', to: 'users#follow', as: 'follow_user'
  post '/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'

  resources :posts, only: %i[index show create destroy] do
    resources :likes, only: %i[create destroy], shallow: true
    resources :comments, only: %i[index create destroy], shallow: true
    resources :bookmarks, only: %i[create destroy], shallow: true
  end
end
