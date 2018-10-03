# frozen_string_literal: true

class AddJobIdToJobPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :job_postings, :job_id, :integer
  end
end
