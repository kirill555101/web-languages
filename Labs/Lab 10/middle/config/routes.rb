# frozen_string_literal: true

Rails.application.routes.draw do
  root 'generator#index'

  post '/create' => 'generator#create'
end
