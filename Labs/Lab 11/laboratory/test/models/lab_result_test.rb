# frozen_string_literal: true

require 'test_helper'

class LabResultTest < ActiveSupport::TestCase
  def setup
    @one_result = LabResult.new(array: '25 4', all_segments: '25', max_segment: '25', count: 1)
  end

  test 'array should be unique' do
    duplicate_one_result = @one_result.dup
    @one_result.save
    assert_not duplicate_one_result.valid?
  end

  test 'array should be present' do
    @one_result.array = ''
    assert_not @one_result.valid?
  end

  test 'all_segments should be present' do
    @one_result.all_segments = ''
    assert_not @one_result.valid?
  end

  test 'max_segment should be present' do
    @one_result.max_segment = ''
    assert_not @one_result.valid?
  end
end
