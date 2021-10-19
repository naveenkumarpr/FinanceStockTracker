 
Rails.application.routes.draw do
 
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root 'page#home'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friend', to: 'users#search'
  get 'refresh_stock_prices', to: 'users#refresh_stock_prices'
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show], :collection => {:refresh_stock_prices => :post}
end
