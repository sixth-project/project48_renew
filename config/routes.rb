# frozen_string_literal: true

Rails.application.routes.draw do

  get 'posts/create'

  get 'posts/destroy'

  ActiveAdmin.routes(self)
 root 'home#index'
 devise_for :users, controllers: {
        registrations: 'users/registrations'
 }
 resources :users, only: [:show]
 resources :posts, only: [:create, :destroy, :edit, :update]
end
