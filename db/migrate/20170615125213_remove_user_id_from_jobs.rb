# frozen_string_literal: true

class RemoveUserIdFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :user_id, :integer
  end
end
