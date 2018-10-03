# frozen_string_literal: true

json.extract! job_posting_answer, :id, :content, :job_application_id, :created_at, :updated_at
json.url job_posting_answer_url(job_posting_answer, format: :json)
