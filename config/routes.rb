Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  devise_for :users
  get 'home/download_sample_csv'
  get 'home/sample'
  resources :students do
    collection do
      get :import
      post :upload
    end
  end    
  root 'home#index'
end
