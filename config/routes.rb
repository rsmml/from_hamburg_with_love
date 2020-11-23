Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :carts

  resources :products do
    resources :reviews, only %i[index new create destroy]
  end


end
