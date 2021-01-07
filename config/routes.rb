Rails.application.routes.draw do
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  resources :home
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
 end
end