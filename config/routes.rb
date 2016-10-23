Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :jobs
  root 'jobs#index'
end
