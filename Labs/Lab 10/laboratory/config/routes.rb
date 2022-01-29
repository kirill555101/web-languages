# frozen_string_literal: true

Rails.application.routes.draw do
  root 'base#index'

  get '/create' => 'base#create'
end
