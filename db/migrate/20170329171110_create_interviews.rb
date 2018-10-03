# frozen_string_literal: true

class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.references :job_posting, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
