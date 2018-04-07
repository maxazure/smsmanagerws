Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'ws/getphone', to:'webservice#getphone'
  get 'ws/report', to:'webservice#report'
  get 'webservice/report'

  get 'appointment', to: "appointment#index"
  post 'appointment', to: "appointment#upload"

  get 'appointment/report'

  root to: "appointment#index"

  resources :templates
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
