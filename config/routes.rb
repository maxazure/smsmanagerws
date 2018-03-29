Rails.application.routes.draw do
  get 'ws/getphone', to:'webservice#getphone'
  get 'ws/report', to:'webservice#report'
  get 'webservice/report'

  get 'appointment', to: "appointment#index"
  post 'appointment', to: "appointment#upload"

  get 'appointment/report'

  root to: 'session#login'

  get 'session/login'
  get 'session/logout'

  resources :templates
  resources :companies
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
