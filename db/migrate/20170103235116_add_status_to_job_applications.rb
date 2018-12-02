# frozen_string_literal: true

class AddStatusToJobApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :job_applications, :status, :integer, default: 0
  end
end
