class Position < ApplicationRecord

  belongs_to :job
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_cannot_be_before_start_date

  def active?
    if start_date.nil? || end_date.nil?
      return false
    else
      DateTime.current >= start_date && DateTime.current <= end_date
    end
  end

  private
  
    def end_date_cannot_be_before_start_date
      if end_date && start_date
        if end_date <= start_date
          errors.add(:end_date, "can't be before or the same day as the start date")
        end
      end
    end

end
