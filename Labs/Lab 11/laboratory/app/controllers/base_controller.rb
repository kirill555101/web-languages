# frozen_string_literal: true

# BaseController class
class BaseController < ApplicationController
  def index
    @result = LabResult.all
  end

  def create
    number = params[:number].to_i
    array = params[:str].split.map(&:to_i)
    @error = number != array.length ? 'Введите n чисел' : ''
    @array = array.join(' ')
    @is_new_element = true
    if res = LabResult.find_by_array(@array)
      @all_segments = res.all_segments
      @max_segment = res.max_segment
      @count = res.count
      @is_new_element = false
      @result = LabResult.all
    else
      @all_segments = array.chunk_while do |first, second|
        multiply_five?(first) == multiply_five?(second)
      end.find_all { |segment| multiply_five?(segment[0]) }
      @count = @all_segments.length
      @max_segment = @all_segments.max_by(&:length)
      @all_segments = @all_segments.join(' ')
      @max_segment = @max_segment&.join(' ')

      if @error != ''
        @result = LabResult.all
        nil
      else
        @all_segments = 'Нет отрезков' if @all_segments == ''
        @max_segment = 'Нет отрезка' if @all_segments == 'Нет отрезков'
        @result = LabResult.all
        res = LabResult.create(array: @array, all_segments: @all_segments, max_segment: @max_segment,
                               count: @count)
        res.save
      end
    end
  end

  def results
    @result = LabResult.all
    render xml: @result
  end

  private def multiply_five?(elem)
    x = Math.log(elem, 5)
    elem != 1 ? (x.round == x) : false
  end
end
