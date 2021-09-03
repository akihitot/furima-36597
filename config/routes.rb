Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items do
    resources :purchases, only: [:index, :create]
  end
end
