# frozen_string_literal: true

class AddCreatorIdToJobPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :job_postings, :creator_id, :integer
  end
end
