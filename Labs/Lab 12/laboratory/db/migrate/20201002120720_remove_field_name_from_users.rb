# frozen_string_literal: true

class RemoveFieldNameFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password_digest, :string
  end
end
