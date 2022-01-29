# frozen_string_literal: true

class LabResult < ApplicationRecord
  validates_uniqueness_of :array
  validates_presence_of :array, :all_segments, :max_segment, :count
end
