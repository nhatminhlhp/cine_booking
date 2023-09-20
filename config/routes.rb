Rails.application.routes.draw do
  get     "login"    => "authorizations/sessions#new"
  post    "login"    => "authorizations/sessions#create"
  delete  "logout"   => "authorizations/sessions#destroy"
  namespace :authorizations do
    resources :users
  end

  namespace :users do
    resources :movies
    resources :profile
  end

  namespace :admins do
    resources :movies
    resources :profile
  end
end
