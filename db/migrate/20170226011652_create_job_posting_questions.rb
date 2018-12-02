# frozen_string_literal: true

class CreateJobPostingQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posting_questions do |t|
      t.references :job_posting, foreign_key: true
      t.text :question

      t.timestamps
    end
  end
end
