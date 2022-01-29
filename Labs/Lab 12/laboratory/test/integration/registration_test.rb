# frozen_string_literal: true

require 'test_helper'

class RegistrationTest < ActionDispatch::IntegrationTest
  test 'redirect from index' do
    post '/create', params: { number: 5, str: '1 2 3 4 5' }
    assert_response :redirect
  end

  test 'can find a result from new authorized user' do
    post '/create_new_user', params: { name: 'user', email: 'user@mail.ru', password: '123', another_password: '123' }
    assert_response :redirect

    get '/logout'
    assert_response :redirect

    post '/auth', params: { name: 'user', password: '123' }
    assert_response :redirect

    post '/create', params: { number: 10, str: '1 5 5 25 7 8 10 5 125 10' }
    assert_equal assigns[:max_segment], '5 5 25'
  end
end
