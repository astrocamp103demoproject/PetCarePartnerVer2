Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backend', as: 'rails_admin'
  mount TaiwanCity::Engine => '/taiwan_city'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'search#index'

  resource :searches, only: [:index, :show, :update]

  resources :users, only: [:show, :edit, :update] do
    member do
      resources :orders, only: [:index, :show]
    end
  end

  resources :sitters, except: [:destroy] do
    member do
      resources :orders, only: [:index, :show, :edit, :update]
    end
  end

end
