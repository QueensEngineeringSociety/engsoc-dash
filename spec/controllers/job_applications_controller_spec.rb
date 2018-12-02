# frozen_string_literal: true

require 'rails_helper'

describe JobApplicationsController do
  context 'When logged in as superadmin' do
    login_superadmin
  end

  context 'When logged in as student' do
    login_student
  end
end
