# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    @url = root_url
    subject = 'Welcome to Dash'
    send_mail(@user, subject)
  end

  def submit_job_application(job_application)
    job_application_setup_user(job_application)
    subject = 'Job Application for ' + @job_application.job_posting.title
    send_mail(@user, subject)
  end

  def hire_job_application(job_application)
    job_application_setup_user(job_application)
    subject = 'Congratulations! You have been hired as a ' + @job_application.job_posting.title
    send_mail(@user, subject)
  end

  def decline_job_application(job_application)
    job_application_setup_user(job_application)
    subject = 'Job Application update for ' + @job_application.job_posting.title
    send_mail(@user, subject)
  end

  def interview_scheduled(job_application)
    job_application_setup_user(job_application)
    @interview = @job_application.interview
    subject = 'Interview scheduled from ' + @interview.start_time.strftime('%A, %d %b at %l:%M %p') + ' to ' + @interview.end_time.strftime('%I:%M %p') + ' for ' + @job_application.job_posting.title
    send_mail(@user, subject)
  end

  def interview_rescheduled(job_application)
    job_application_setup_user(job_application)
    @interview = @job_application.interview
    subject = 'Interview for ' + @job_application.job_posting.title + ' has been rescheduled'
    send_mail(@user, subject)
  end

  # interview reminder (1hr before)
  # interview cancelling
  # job posting deadline has passed

  private

  def job_application_setup_user(job_application)
    @job_application = job_application
    @user = @job_application.user
  end

  # check preference and send
  def send_mail(recipient, subject)
    if recipient.email_notifications
      mail(to: recipient.email, subject: subject)
    else
      p 'recipient has email notifications turned off.'
    end
  end
end
