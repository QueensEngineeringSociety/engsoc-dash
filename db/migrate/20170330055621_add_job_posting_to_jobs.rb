# frozen_string_literal: true

class AddJobPostingToJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :job_posting, foreign_key: true
  end
end
