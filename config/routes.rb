Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login , sign_out: :logout },
             controllers: { sessions: 'user/sessions'  }

  resources :contacts, only: %i[new create]
  resources :badges, only: :index

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :passed_tests, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
    resources :badges
  end
end
