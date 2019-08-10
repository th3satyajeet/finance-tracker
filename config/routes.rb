Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Root page of the app
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'

  post 'add_friend', to: 'users#add_friend'
  # Add search for friends
  get 'search_friends', to: 'users#search'
  resources :user_stocks, only: [:create, :destroy]

  resources :users, only: [:show]
  resources :friendships
end
