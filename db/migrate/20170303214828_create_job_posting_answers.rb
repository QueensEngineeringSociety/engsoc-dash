# frozen_string_literal: true

class CreateJobPostingAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posting_answers do |t|
      t.text :content
      t.references :job_application, foreign_key: true

      t.timestamps
    end
  end
end
