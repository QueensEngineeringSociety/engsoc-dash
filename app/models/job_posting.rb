# frozen_string_literal: true

class JobPosting < ApplicationRecord
  include Filterable

  scope :status, ->(status) { where status: status }
  scope :job_department, ->(department) { joins(job: :organization).where(organizations: { department: Organization.departments[department] }) }
  scope :job_type, ->(job_type) { joins(:job).where(jobs: { job_type: job_type }) }

  # Relationships
  # a job posting belongs to a job
  belongs_to :job, foreign_key: :job_id, dependent: :destroy
  # a job posting belongs to a user
  belongs_to :user, foreign_key: :creator_id

  # delete job applications if the related job posting is deleted
  has_many :job_applications, dependent: :destroy
  # delete job posting questions if the related job posting is deleted
  has_many :job_posting_questions, dependent: :destroy

  has_many :positions

  # different statuses for a job posting
  enum status: %i[waiting_approval draft open interviewing closed extension_pending]

  # Validations
  # make sure a job_id is present
  validates :job_id, presence: true
  # title must be minimum length of five characters
  validates :title, presence: true, length: { maximum: 100 }
  # description must be at least fifteen characters
  validates :description, presence: true, length: { minimum: 15, maximum: 4000 }
  validates :deadline, presence: true

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_cannot_be_before_start_date, :end_date_cannot_be_in_the_past

  # Remove to manual 'validations' as admins must approve postings, for greater flexibility
  # validate :deadline_cannot_be_in_the_past
  # validate :deadline_cannot_be_within_two_weeks

  accepts_nested_attributes_for :positions

  def active?
    status == 'open'
  end

  private

  def deadline_cannot_be_in_the_past
    errors.add(:deadline, 'cannot be in the past') if deadline < Date.today
  end

  def deadline_cannot_be_within_two_weeks
    two_weeks_later = Date.today + 2.weeks
    errors.add(:deadline, 'cannot be within 2 weeks') if deadline < two_weeks_later
  end

  def end_date_cannot_be_in_the_past
    if end_date.nil?
      false
    elsif end_date < Date.today
      errors.add(:end_date, 'cannot be in the past')
    end
  end

  def end_date_cannot_be_before_start_date
    if end_date.nil? || start_date.nil?
      false
    elsif end_date <= start_date
      errors.add(:end_date, "can't be before or the same day as the start date")
    end
  end
end
