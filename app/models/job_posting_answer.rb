# frozen_string_literal: true

class JobPostingAnswer < ApplicationRecord
  # Relationships
  # a job application answer belongs to a job application
  belongs_to :job_application, foreign_key: :job_application_id
  validates :job_application_id, presence: true
  # a job application answer belongs to a question
  belongs_to :job_posting_question
  validates :job_posting_questions_id, presence: true
  validates :content, length: { maximum: 6000 }
end
