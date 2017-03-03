class JobPosting < ApplicationRecord
  belongs_to :organization, :foreign_key => :organization_id, dependent: :destroy
  belongs_to :user, :foreign_key => :creator_id
  has_many :job_applications, dependent: :destroy
  has_many :job_posting_questions, dependent: :destroy
  enum status: [:waiting_approval, :draft, :open, :interviews_pending, :interviews_scheduled, :closed ]
  validates :organization_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 15, maximum: 2000 }
end