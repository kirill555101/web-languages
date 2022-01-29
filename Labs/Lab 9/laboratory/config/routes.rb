# frozen_string_literal: true

Rails.application.routes.draw do
  root 'base#index'

  post '/create' => 'base#create'
end
