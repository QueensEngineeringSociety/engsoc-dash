# frozen_string_literal: true

class AddArchivedToJobApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :job_applications, :archived, :boolean, default: false
  end
end
