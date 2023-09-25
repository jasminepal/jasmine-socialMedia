Rails.application.routes.draw do
  get 'users/sign_up_params'
  devise_for :users, controllers: { registrations: 'users' }
  resources :socios
  resources :socios do
    resources :likes, only: [:create, :destroy]
  end
  resources :socios do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :relationships, only: [:create, :destroy]
  root "socios#index"
end


# resources :users do
#   member do
#     post 'follow'
#     delete 'unfollow'
#   end
# end