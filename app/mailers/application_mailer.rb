# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'donotreply@engsoc.queensu.ca'
  layout 'mailer'
end
