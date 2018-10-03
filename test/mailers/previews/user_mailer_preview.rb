# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.first
    UserMailer.welcome(user)
  end

  def submit_job_application
    job_application = JobApplication.first
    UserMailer.submit_job_application(job_application)
  end

  def hire_job_application
    job_application = JobApplication.first
    UserMailer.hire_job_application(job_application)
  end

  def decline_job_application
    job_application = JobApplication.first
    UserMailer.decline_job_application(job_application)
  end

  def interview_scheduled
    job_application = JobApplication.first
    UserMailer.interview_scheduled(job_application)
  end

  def interview_rescheduled
    job_application = JobApplication.first
    UserMailer.interview_rescheduled(job_application)
  end
end
