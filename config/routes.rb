Rails.application.routes.draw do
  root 'defaults#index'
  
  # Authentication
  devise_for :users, controllers: { registrations: 'registrations'}, skip: [:sessions]

  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  post 'users/login', to: 'users#login'
  get 'collaborators', to: 'users#index'
  post 'collaborators', to: 'users#create', as: :new_collaborator

  # Resources
  resources :users
  resources :areas
  resources :categories
  resources :revisions
  resources :asset_revisions, only: [:create, :destroy]

  resources :assets do
    resources :warranties, shallow: true
    resources :technical_details, shallow: true
    resources :network_details, shallow: true
    resources :security_details, shallow: true
    resources :relocations

    resources :identification_codes, only: [:index, :show] do
      member do
        post 'print'
      end
    end

    resources :relocations
    resources :loans do
      post 'toggle', on: :member
    end

    get 'search', on: :collection
  end

  get 'loans', to: 'loans#all', as: :loans
  # get 'tickets', to: 'loans#all', as: :loans

  get 'app', to: 'defaults#app', as: :app
  get 'app/download', to: 'defaults#download', as: :app_download
  get 'help', to: 'defaults#help', as: :help
  get 'status', to: 'defaults#status', as: :status
end
