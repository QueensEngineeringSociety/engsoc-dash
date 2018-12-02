# frozen_string_literal: true

class Organization < ApplicationRecord
  include Filterable

  scope :status, ->(status) { where status: status }
  scope :department, ->(department) { where department: department }
  # This scope needs a rewrite since the introduction of Positions through model
  # scope :user_managed, -> (current_user) { includes(:jobs).where(jobs: { :user_id => current_user.id, :role => ["management", "admin"] })}

  # Relationships
  # an organization has many jobs, delete if organization is also deleted
  has_many :jobs, dependent: :destroy
  # an organization has many users through their jobs, many to many
  has_many :users, through: :jobs

  # set the scope when performing actions
  default_scope -> { order(name: :asc) }

  # type of organizations with the engineering society
  enum department: %i[
    conferences
    design_teams
    services
    clubs
    events
    communications
    internal_affairs
    academics
    community_outreach
    science_formal
    first_year
    orientation_week
    human_resources
    professional_development
    finance
    information_technology
    engineering_review_board
    directors
  ]

  # db declaration defaults to 0
  enum status: %i[waiting_approval active archived]

  # Validations
  # make sure the name is present and is unique
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  # make sure the email is present and is unique
  validates :email, presence: true, uniqueness: true
  # set bounds and make sure unique description
  validates :description, presence: true, length: { minimum: 10, maximum: 4000 }
  validates :department, presence: true

  accepts_nested_attributes_for :jobs
end
