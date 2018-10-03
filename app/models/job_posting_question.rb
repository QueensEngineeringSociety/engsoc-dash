# frozen_string_literal: true

class JobPostingQuestion < ApplicationRecord
  # Relationships
  # a job posting question belongs to a job posting
  belongs_to :job_posting, foreign_key: :job_posting_id
  validates :job_posting_id, presence: true
  # a job posting question has many job posting answers
  has_many :job_posting_answers, foreign_key: :job_posting_questions_id, dependent: :destroy

  # Validations
  # make sure the question is present and set bound
  validates :content, presence: true, length: { minimum: 5 }
end
