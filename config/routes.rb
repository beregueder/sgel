Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pt/ do
    resources :books do
      resources :reviews, only: [:create, :update], module: :books
    end
    resources :users

    resource :confirmation, only: [:show]
    resource :user_sessions, only: [:create, :new, :destroy]
  end

  get '/:locale' => 'home#index', locale: /en|pt/

  root 'home#index'
end
