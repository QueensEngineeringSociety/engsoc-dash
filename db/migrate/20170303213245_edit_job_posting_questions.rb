# frozen_string_literal: true

class EditJobPostingQuestions < ActiveRecord::Migration[5.0]
  def change
    rename_column :job_posting_questions, :question, :content
  end
end
