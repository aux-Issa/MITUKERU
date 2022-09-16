# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shops, only: [:show]
  resources :cities, only: [:show]
  resources :prefectures, only: [:show]
  resources :reviews, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # 【ヘルスチェック用】
  get '/ops/heartbeat', to: 'health_check#index'
end
