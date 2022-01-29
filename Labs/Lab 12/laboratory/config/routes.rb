# frozen_string_literal: true

Rails.application.routes.draw do
  root 'base#index'

  get '/show_users_in_xml' => 'user_interaction#show_users_in_xml'
  get '/login' => 'user_interaction#login'
  get '/logout' => 'user_interaction#logout'
  get '/register' => 'user_interaction#register'
  get '/users_list' => 'user_interaction#users_list'
  post '/auth' => 'user_interaction#auth'
  post '/create_new_user' => 'user_interaction#create_new_user'

  get '/show_results_in_xml' => 'base#show_results_in_xml'
  post '/create' => 'base#create'
end
