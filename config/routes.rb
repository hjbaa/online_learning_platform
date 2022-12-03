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

    post '/group/:id/add-student/:student_id', to: 'groups#add_to_group', as: 'add_to_group'
    post '/group/:id/kick-student/:student_id', to: 'groups#kick_from_group', as: 'kick_from_group'
  end

  get '/tests/:id', to: 'tests#test_passing', as: 'test_passing'
end
