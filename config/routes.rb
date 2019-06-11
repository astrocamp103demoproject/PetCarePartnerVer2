Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backend', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'search#index'

  resources :search, only: [:index, :show]

  resources :users do
    member do
      resources :orders
    end
  end

  resources :sitter do
    member do
      resources :order
    end
  end

end
