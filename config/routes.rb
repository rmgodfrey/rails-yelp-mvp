# frozen_string_literal: true

Rails.application.routes.draw do
  resources :restaurants, only: %I[index show new create] do
    resources :reviews, only: %I[new create]
  end
end
