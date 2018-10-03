# frozen_string_literal: true

class ChangeUserIdType < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
