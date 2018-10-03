# frozen_string_literal: true

class AddJobToJobPostings < ActiveRecord::Migration[5.0]
  def change
    add_reference :job_postings, :job, foreign_key: true
    remove_column :job_postings, :organization_id
  end
end
