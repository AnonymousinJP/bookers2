Rails.application.routes.draw do
  #get 'users/show'
  #get 'users/edit'
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'

  devise_for :users
  root to: 'homes#top'

  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update]

  get '/home/about'=>'homes#about', as: 'about'

  #Home -> books/user_id
  #Users -> users/index
  #Books -> books/index
  #投稿 -> books/id
end
