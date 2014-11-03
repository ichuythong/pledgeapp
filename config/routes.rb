Rails.application.routes.draw do
  root    'home#index'
  get     :challenge,       to: 'page#challenge'
  get     :cause,           to: 'page#cause'
  get     :pledge,          to: 'pledge#index'
  post    :pledge,          to: 'pledge#create'
  namespace :admin do
    resources :donators
  end
end
