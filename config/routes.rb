Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :homes
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :books
end