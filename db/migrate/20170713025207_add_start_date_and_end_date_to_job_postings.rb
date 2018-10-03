# frozen_string_literal: true

class AddStartDateAndEndDateToJobPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :job_postings, :start_date, :datetime
    add_column :job_postings, :end_date, :datetime
  end
end
