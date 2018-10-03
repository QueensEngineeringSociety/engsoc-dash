# frozen_string_literal: true

class Position < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :job_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :job_id }
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_cannot_be_before_start_date

  def active?
    if start_date.nil? || end_date.nil?
      false
    else
      DateTime.current >= start_date && DateTime.current <= end_date
    end
  end

  def future?
    if start_date.nil? || end_date.nil?
      false
    else
      start_date > DateTime.current
    end
  end

  private

  def end_date_cannot_be_before_start_date
    if end_date.nil? || start_date.nil?
      false
    elsif end_date <= start_date
      errors.add(:end_date, "can't be before or the same day as the start date")
    end
  end
end
