# frozen_string_literal: true

require 'test_helper'

class BaseControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/'
    assert_response :success
  end

  test 'should get 5 5 25 for create entered data' do
    post '/create', params: { number: 10, str: '1 5 5 25 7 8 10 5 125 10' }
    assert_equal assigns[:max_segment], '5 5 25'
  end

  test 'should get Введите n чисел for incorrect params' do
    post '/create', params: { number: 2, str: '1 2 3 4 5' }
    assert_equal assigns[:error], 'Введите n чисел'
  end
end
