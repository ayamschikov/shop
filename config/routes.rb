# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: 'web' do
    namespace :admin do
      root 'welcome#index'
      resources :users
      resources :products
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
