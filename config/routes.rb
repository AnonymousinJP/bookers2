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

  #コメントといいね機能に関する記述
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy] #resource単数形になっている点に注意
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  #Home -> books/user_id
  #Users -> users/index
  #Books -> books/index
  #投稿 -> books/id
end
