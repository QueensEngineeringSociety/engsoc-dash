# frozen_string_literal: true

class AddUserIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_id, :string
  end
end
