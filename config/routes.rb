Rails.application.routes.draw do
  get 'users/sign_up_params'
  devise_for :users, controllers: { registrations: 'users' }
  resources :socios
  resources :socios do
    resources :likes, only: [:create, :destroy]
  end
  root "socios#index"
end
# 