Rails.application.routes.draw do
  get 'categories/index'

  root 'defaults#index'

  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :areas
  resources :categories
  resources :assets do
    resources :warranties, shallow: true
    resources :technical_details, shallow: true
    resources :network_details, shallow: true
    resources :security_details, shallow: true
    resources :identification_codes, only: [:index, :show] do
      member do
        get 'print'
      end
    end
    resources :relocations
  end
end
