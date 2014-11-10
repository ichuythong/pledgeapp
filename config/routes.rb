Rails.application.routes.draw do
  root    'pages#challenge'

  get     :challenge,       to: 'pages#challenge'
  get     :cause,           to: 'pages#cause'

  resources :donors, only: [:index, :create]

  namespace :admin do
    resources :donors
  end
end
