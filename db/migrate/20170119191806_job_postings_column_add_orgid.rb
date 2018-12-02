# frozen_string_literal: true

class JobPostingsColumnAddOrgid < ActiveRecord::Migration[5.0]
  def change
    rename_column :job_postings, :job_id, :organization_id
  end
end
