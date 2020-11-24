Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :product_category

  resources :products do
    resources :reviews, only: %i[index new create destroy]
  end
end
