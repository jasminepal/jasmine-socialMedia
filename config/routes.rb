Rails.application.routes.draw do
  get 'users/sign_up_params'
  devise_for :users, controllers: { registrations: 'users' }
  resources :socios do
    member do
      post 'like'
      delete 'unlike'
    end
  end
  root "socios#index"
end
