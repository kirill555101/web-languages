# frozen_string_literal: true

class AddPasswordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password, :string
  end
end
