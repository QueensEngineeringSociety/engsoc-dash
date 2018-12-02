# frozen_string_literal: true

class ChangeJobPostingAnswer < ActiveRecord::Migration[5.0]
  def change
    rename_table :job_application_answers, :job_posting_answers
  end
end
