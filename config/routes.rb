Rails.application.routes.draw do
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#top'
  get 'home/about' => 'home#about'
  get 'books/like' => 'books#like'
  get 'books/hello' => 'books#hello'
  #get 'books/index' => 'books#index'

  resources :books
  resources :users
end
