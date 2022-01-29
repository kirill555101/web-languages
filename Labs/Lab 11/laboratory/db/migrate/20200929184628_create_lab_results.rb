# frozen_string_literal: true

class CreateLabResults < ActiveRecord::Migration[5.1]
  def change
    create_table :lab_results do |t|
      t.string :array
      t.string :all_segments
      t.string :max_segment
      t.integer :count

      t.timestamps
    end
  end
end
