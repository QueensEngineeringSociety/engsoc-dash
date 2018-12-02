# frozen_string_literal: true

class DropRedundantIdsForOrgsAndUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :user_id
    remove_column :organizations, :organization_id
  end
end
