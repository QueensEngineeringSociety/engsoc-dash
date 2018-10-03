# frozen_string_literal: true

class AddItemsToJobPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :job_postings, :deadline, :datetime
    add_column :jobs, :type, :integer, default: 0
    add_column :jobs, :email, :string
  end
end
