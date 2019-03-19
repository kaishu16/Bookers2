Rails.application.routes.draw do
  root 'root#top'
  get 'root/about' => 'root#about', as: 'about'
  get 'users/home' => 'users#home', as: 'home'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:index, :create, :show, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
