Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backend', as: 'rails_admin'
  mount TaiwanCity::Engine => '/taiwan_city'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'search#index'

  resource :searches, only: [:index, :show, :create]

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
