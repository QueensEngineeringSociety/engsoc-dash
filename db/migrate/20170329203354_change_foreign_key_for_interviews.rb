# frozen_string_literal: true

class ChangeForeignKeyForInterviews < ActiveRecord::Migration[5.0]
  def change
    rename_column :interviews, :job_posting_id, :job_application_id
  end
end
