# frozen_string_literal: true

class AddPreferredNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :preferred_name, :string
  end
end
