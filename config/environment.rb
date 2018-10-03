# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Specify ActionMailer settings to point to SendGrid
ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  domain: ENV['SENDGRID_DOMAIN'],
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

# Initialize the Rails application.
Rails.application.initialize!
