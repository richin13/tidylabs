Rails.application.routes.draw do
  get 'categories/index'

  root 'defaults#index'

  devise_for :users, controllers: { registrations: 'registrations'}, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  post 'users/login', to: 'users#login'
  resources :users
  resources :areas
  resources :categories
  resources :assets do
    resources :warranties, shallow: true
    resources :technical_details, shallow: true
    resources :network_details, shallow: true
    resources :security_details, shallow: true
    resources :identification_codes, shallow: true
    resources :relocations
  end

  get 'collaborators', to: 'users#index'
  post 'collaborators', to: 'users#create', as: :new_collaborator
end
