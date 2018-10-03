# frozen_string_literal: true

class RenameJobPostingAnswer < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :job_posting_answers, :job_application_answers
  end

  def self.down
    rename_table :job_application_answers, :job_posting_answers
  end
end
