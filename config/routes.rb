# frozen_string_literal: true

Rails.application.routes.draw do
  resources :personal_profiles
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  unauthenticated do
    root to: 'static#home'
  end

  authenticated :user do
    root to: 'dashboards#show', as: :user_root
    resource :organization
    resources :service_requests
    resources :warehouses
    resources :recipients
    resources :addresses

    namespace :admin do
      resources :organizations
    end
  end
end
