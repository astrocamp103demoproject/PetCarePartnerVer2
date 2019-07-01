Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  mount RailsAdmin::Engine => '/backend', as: 'rails_admin'
  mount TaiwanCity::Engine => '/taiwan_city'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'search#index'

  resource :searches, only: [:index, :show, :update, :create]

  resources :users, only: [:show, :edit, :update] do
    resources :pictures, only: [:index,:show, :new, :create, :destroy]
    resources :pets, except: [:index]
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get :pending
        get :finish
        get :cancel
      end
    end
  end
  
  resources :sitters, except: [:destroy] do
    resources :booking_dates, only: [:new, :create, :destroy]
    # resources :pictures, only: [:show, :new, :create, :destroy]
    resources :comments, only: [:index, :new, :create]
    resources :pictures, only: [ :index,:show, :new, :create, :destroy]
  end

end
