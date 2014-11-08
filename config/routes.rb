Rails.application.routes.draw do
  root    'pages#home'

  get     :challenge,       to: 'pages#challenge'
  get     :cause,           to: 'pages#cause'

  resources :donors, only: [:index, :create]

  namespace :admin do
    resources :donors
  end
end
