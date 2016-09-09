require 'sidekiq/web'

Rails.application.routes.draw do

  resources :users
  root "users#new"

  mount Sidekiq::Web => '/sidekiq'
end
