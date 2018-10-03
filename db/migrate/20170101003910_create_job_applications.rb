# frozen_string_literal: true

class CreateJobApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :job_applications do |t|
      t.timestamps
      t.integer :user_id
      t.integer :job_posting_id
    end
  end
end
