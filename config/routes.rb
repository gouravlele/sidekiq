Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'home/download_sample_csv'
  get 'home/sample'
  resources :students do
    collection do
      get :import
      post :upload
    end
  end    
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
end
