Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'articles#index'

  resources :articles, only: %i[index show]

  namespace :teacher do
    resources :articles
    resources :tests, only: %i[create]
  end
end
