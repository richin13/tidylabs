Rails.application.routes.draw do
  root 'defaults#index'

  devise_for :users
end
