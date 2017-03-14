class JobPosting < ApplicationRecord

  #Relationships
  belongs_to :organization, :foreign_key => :organization_id, dependent: :destroy
  belongs_to :user, :foreign_key => :creator_id

  #delete job applications if the related job posting is deleted
  has_many :job_applications, dependent: :destroy
  #delete job posting questions if the related job posting is deleted
  has_many :job_posting_questions, dependent: :destroy

  #different statuses for a job posting
  enum status: [:waiting_approval, :draft, :open, :interviews_pending, :interviews_scheduled, :closed, :extension_pending]

  #Validations
  #make sure a organization_id is present
  validates :organization_id, presence: true
  #title must be minimum length of five characters
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  #description must be at least fifteen characters
  validates :description, presence: true, length: { minimum: 15, maximum: 2000 }

end
