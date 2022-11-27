Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'articles#index'

  resources :articles, only: %i[index show]


  namespace :teacher do
    get '/', to: 'teachers#show', as: ''

    resources :subjects do
      resources :articles, shallow: true
    end

    resources :tests, only: %i[create destroy]
    resources :groups
  end

  get '/tests/:id', to: 'tests#test_passing', as: 'test_passing'
end
