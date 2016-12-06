Rails.application.routes.draw do
  devise_for :users

  resources :disableds

  get 'profile', to: 'users#profile'
  root to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
