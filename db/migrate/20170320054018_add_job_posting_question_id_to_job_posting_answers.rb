# frozen_string_literal: true

class AddJobPostingQuestionIdToJobPostingAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :job_posting_answers, :job_posting_questions, foreign_key: true
  end
end
