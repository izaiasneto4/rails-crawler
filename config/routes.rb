# frozen_string_literal: true

Rails.application.routes.draw do
  resources :news do
    match '/scrape', to: 'news#scrape', via: :post, on: :collection
    match '/search', to: 'news#search', via: :get, on: :collection
  end
  root to: 'news#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
