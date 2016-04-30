Rails.application.routes.draw do
  devise_for :users

  root 'yarns#index'

  resources :yarns, except: :show

end
