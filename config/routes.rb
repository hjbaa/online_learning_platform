Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'subjects#index'

  resources :subjects, only: %i[index show] do
    resources :articles, only: %i[show], shallow: true
  end

  namespace :teacher do
    get '/', to: 'teachers#show', as: ''

    resources :subjects do
      resources :articles, shallow: true
    end

    resources :tests, except: :index
    resources :groups
    resources :visibilities, only: %i[create destroy]

    post '/group/:id/add-student/:student_id', to: 'groups#add_to_group', as: 'add_to_group'
    post '/group/:id/kick-student/:student_id', to: 'groups#kick_from_group', as: 'kick_from_group'
  end

  get '/tests/:id', to: 'tests#test_passing', as: 'test_passing'
end
