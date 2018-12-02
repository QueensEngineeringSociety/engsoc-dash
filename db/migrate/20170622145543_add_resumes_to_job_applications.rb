# frozen_string_literal: true

class AddResumesToJobApplications < ActiveRecord::Migration[5.0]
  def change
    add_reference :job_applications, :resumes, foreign_key: true
  end
end
