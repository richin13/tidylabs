Rails.application.routes.draw do
  root 'defaults#index'

  resources :areas
  resources :assets do
    resources :warranties, shallow: true
    resources :identification_codes, shallow: true
    resources :relocations
  end

  devise_for :users
end
