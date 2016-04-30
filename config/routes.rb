Rails.application.routes.draw do
  namespace :admin do
    resources :users
resources :yarns

    root to: "users#index"
  end

  devise_for :users

  root 'yarns#index'

  resources :yarns, except: :show

end
