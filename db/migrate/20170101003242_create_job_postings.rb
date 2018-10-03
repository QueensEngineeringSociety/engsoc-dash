# frozen_string_literal: true

class CreateJobPostings < ActiveRecord::Migration[5.0]
  def change
    create_table :job_postings do |t|
      t.timestamps
      t.integer :status, default: 0
      t.string :description
    end
  end
end
