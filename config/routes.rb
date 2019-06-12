Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backend', as: 'rails_admin'
  root 'search#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
