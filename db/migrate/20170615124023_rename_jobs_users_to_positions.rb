# frozen_string_literal: true

class RenameJobsUsersToPositions < ActiveRecord::Migration[5.0]
  def change
    rename_table :jobs_users, :positions
    add_column :positions, :id, :primary_key
    add_index :positions, :job_id
    add_index :positions, :user_id
  end
end
