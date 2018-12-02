# frozen_string_literal: true

class User < ApplicationRecord
  # Relationships
  # a user can have many jobs
  # has_many :jobs, dependent: :destroy
  has_many :jobs, through: :positions
  has_many :positions
  # a user can be part of many organizations
  has_many :organizations, through: :jobs
  # a user can have many job applications, delete applications if user is deleted
  has_many :job_applications, dependent: :destroy
  # a user can have many job postings, given permission levels
  has_many :job_postings, foreign_key: :creator_id

  has_many :resumes, dependent: :destroy

  # the roles a user can be associated with
  enum role: %i[student superadmin]

  enum gender: %i[unspecified male female]

  validates :phone_number, allow_blank: true, length: { maximum: 15 }, format: { with: /\A[0-9]([0-9]|[- ](?!-))+\z/ }
  validates :tagline, length: { maximum: 50 }
  validates :bio, length: { maximum: 2000 }
  validates :faculty, length: { maximum: 50 }
  validates :specialization, length: { maximum: 50 }
  validates :bio, length: { maximum: 2000 }

  # devise authentication system
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  accepts_nested_attributes_for :jobs
end
