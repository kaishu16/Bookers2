Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  get 'users/home' => 'users#home', as: 'home'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:index, :create, :show, :edit, :destroy, :update] do
    resource :book_comments, only: [:create, :edit, :destroy, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
