Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  resources :home
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :books do
    resources :favorites, only: [:create, :destroy]
 end
end