# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :job_application, foreign_key: :job_application_id

  validate :start_time_is_earlier
  validate :less_than_2_hours

  validates :start_time, presence: true
  validates :end_time, presence: true

  private

  def start_time_is_earlier
    errors.add(:start_time, 'should be before end time') if start_time > end_time
  end

  # it would be wise to take in the max hours as a param to make this a reusable component
  def less_than_2_hours
    two_hours_later = start_time + 2.hours
    errors.add(:end_time, 'should be at most 2 hours after start time (interviews must be shorter than 2 hours in duration)') if end_time > two_hours_later
  end

  # should add validation for making sure interviews don't schedule for the past
  # but for the sake of being able to reschedule interviews to simulate completion for dev, not implementing for now
end
