Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index,:new, :create]
    #resources :details, only: [:index, :search]
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit]
  resources :details, only: :index do
    collection do
      get 'search'
    end
  end
end
