Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  mount RailsAdmin::Engine => '/backend', as: 'rails_admin'
  mount TaiwanCity::Engine => '/taiwan_city'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'search#index'

  resource :searches, only: [:index, :show, :update, :create]

  resources :users, only: [:show, :edit, :update] do
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get :pending
        get :finish
        get :cancel
      end
    end
  end

  resources :sitters, except: [:destroy] do
    resource :booking_date, only: [:create]
  end

end
