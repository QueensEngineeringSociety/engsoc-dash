# frozen_string_literal: true

class Job < ApplicationRecord
  scope :job_department, ->(job_department) { joins(:organization).where(organizations: { department: job_department }) }

  # Relationships
  # a job belongs to an organization
  belongs_to :organization, foreign_key: :organization_id
  # a job job belongs to a user
  # belongs_to :user, :foreign_key => :user_id
  has_many :users, through: :positions
  has_many :positions, dependent: :destroy
  has_one :job_posting, foreign_key: :job_id, dependent: :destroy

  # Validations
  # make sure the organization id is present
  validates :organization_id, presence: true
  # make sure the user id is present and unique
  # validates :user_id, presence: true, :uniqueness => { :scope => :organization_id }
  # make sure the title is present
  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: :organization_id }
  validates :description, presence: true, length: { minimum: 15, maximum: 4000 }

  # organizations model has the same status enum
  enum status: %i[waiting_approval active archived]

  enum role: %i[regular management admin]
  enum job_type: %i[volunteer part_time full_time]

  accepts_nested_attributes_for :users, :positions
  # :organization
end
