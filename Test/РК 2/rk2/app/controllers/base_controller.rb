# frozen_string_literal: true

# BaseController class
class BaseController < ApplicationController
  def index; end

  def create
    is_i = ->(element) { element.to_i.to_s == element }
    array = params[:array].split.select { |element| is_i.call element }.map(&:to_i)

    if array.length.zero?
      set_error 'Введите массив, состоящий из чисел!'
      return
    end

    input_array = array.join(' ')
    average = array.inject(&:+) * 1.0 / array.length
    new_array = array.select { |element| element < average }
    result = new_array.length.zero? ? "В данном массиве нет чисел, меньших среднего: #{average}" : "Результат: #{new_array.join(', ')}"

    respond_to do |format|
      format.json do
        render json: { result: result, array: input_array, error: '' }
      end
    end
  end

  private def set_error(error)
    respond_to do |format|
      format.json do
        render json: { error: error }
      end
    end
  end
end
