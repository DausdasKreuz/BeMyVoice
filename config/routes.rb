Rails.application.routes.draw do
  devise_for :users
  get 'users/guide/edit', to: 'users#edit_guide', as: 'user_guide_edit'

  resources :disableds

  get 'profile', to: 'users#profile'
  root to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
