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

      get '/new-test', to: 'tests#new', as: 'tests_new'
    end

    resources :tests, except: %i[new index] do
      resources :questions, shallow: true do
        resources :answers, only: :create
      end
    end

    delete 'questions/:id/destroy_answers', to: 'questions#destroy_answers', as: 'question_destroy_answers'

    resources :groups
    resources :visibilities, only: %i[create destroy]

    post '/group/:id/add-student/:student_id', to: 'groups#add_to_group', as: 'add_to_group'
    post '/group/:id/kick-student/:student_id', to: 'groups#kick_from_group', as: 'kick_from_group'
  end

  get '/tests/:id', to: 'tests#test_passing', as: 'test_passing'
  post '/tests/:id/start', to: 'tests#start'

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
