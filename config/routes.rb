Rails.application.routes.draw do
  root 'defaults#index'

  devise_for :users, skip: [:sessions]
  as :user do
    get 'ingreso', to: 'devise/sessions#new', as: :new_user_session
    post 'ingreso', to: 'devise/sessions#create', as: :user_session
    delete 'salir', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
