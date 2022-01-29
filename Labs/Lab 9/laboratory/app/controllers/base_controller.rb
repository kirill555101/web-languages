# frozen_string_literal: true

# BaseController class
class BaseController < ApplicationController
  def index; end

  def create
    number = params[:number].to_i
    array = params[:str].split.map(&:to_i)

    @error = number != array.length ? 'Введите n чисел' : ''
    @all_segments = array.chunk_while do |first, second|
      multiply_five?(first) == multiply_five?(second)
    end.find_all { |segment| multiply_five?(segment[0]) }
    @has_elements = @all_segments.length.positive?
    @count = @all_segments.length
    @max_segment = @all_segments.max_by(&:length)
    @all_segments = @all_segments.join(' ')
    @max_segment = @max_segment&.join(' ')
    @array = array.join(' ')

    respond_to do |format|
      format.html
      format.json do
        render json:
            { array: @array, all_segments: @all_segments, max_segment: @max_segment, count: @count, error: @error }
      end
    end
  end

  private def multiply_five?(elem)
    x = Math.log(elem, 5)
    elem != 1 ? (x.round == x) : false
  end
end
