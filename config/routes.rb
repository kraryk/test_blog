TestBlog::Application.routes.draw do
  devise_for :users
  resources :posts do
  	resources :comments
  end
  root to: 'posts#index'

 # get 'signup'  => 'users#new' 
 # resources :users

#  get 'login', to: 'sessions#new'
 # post 'login' => 'sessions#create'
 # delete 'logout' => 'sessions#destroy'
end
