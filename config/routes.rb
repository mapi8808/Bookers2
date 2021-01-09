Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'home/about'
  get 'users/follow'
  get 'users/followers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  resources :home
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
 end
 
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end