Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  resources :home
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
 end
end