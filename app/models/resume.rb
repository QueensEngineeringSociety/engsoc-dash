# frozen_string_literal: true

class Resume < ApplicationRecord
  # https://www.tutorialspoint.com/ruby-on-rails/rails-file-uploading.htm

  mount_uploader :attachment, AttachmentUploader

  belongs_to :user
  has_many :job_applications, foreign_key: 'resumes_id', dependent: :nullify

  validates :user_id, presence: true
  validates :name, presence: true
  validates :attachment, presence: true, file_size: { less_than: 2.megabytes }
end
