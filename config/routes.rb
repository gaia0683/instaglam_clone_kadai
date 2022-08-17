Rails.application.routes.draw do
  resources :favorites, only: [:index,:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :posts do
    collection do
      post :confirm
    end
  end

  Rails.application.routes.draw do
    root to: 'posts#index'
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  end
