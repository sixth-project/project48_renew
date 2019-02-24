# frozen_string_literal: true

Rails.application.routes.draw do

  ActiveAdmin.routes(self)
 root 'home#index'
 devise_for :users, controllers: {
        registrations: 'users/registrations'
 }
 resources :users, only: [:show]

end
