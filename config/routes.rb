Rails.application.routes.draw do
  get 'mypofile/index'

  patch 'mypofile/update'

  get 'users/index'

  get 'user/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'ws/getphone', to:'webservice#getphone'
  get 'ws/report', to:'webservice#report'
  get 'webservice/report'

  get 'appointment', to: "appointment#index"
  post 'appointment', to: "appointment#upload"

  get 'appointment/report'
  get 'appointment/delmsg'

  root to: "appointment#index"

  resources :templates
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
