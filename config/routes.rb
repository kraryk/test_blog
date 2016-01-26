TestBlog::Application.routes.draw do
  devise_for :users
  resources :posts do
  	resources :comments
  	resources :tags
  end
  root to: 'posts#index'
  get 'test_controller' => 'test_controller#my_test'
post 'test_controller' => 'test_controller#my_test_create'

 # get 'signup'  => 'users#new' 
 # resources :users

#  get 'login', to: 'sessions#new'
 # post 'login' => 'sessions#create'
 # delete 'logout' => 'sessions#destroy'
end
