Rails.application.routes.draw do
  root 'tests#index'

  get :sign_up, to: 'users#new'
  get :login,   to: 'sessions#new'
  get :logout,  to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  # get '/tests/:category/:title', to: 'tests#search', level: 2
  # get /test_passages/101/result

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
