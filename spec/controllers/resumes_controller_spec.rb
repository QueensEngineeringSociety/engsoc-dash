# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResumesController, type: :controller do
  context 'When logged in as student' do
    login_student

    describe 'GET #index' do
      it 'returns http success' do
        get :index, params: { profile_id: controller.current_user.id }
        expect(response).to have_http_status(:success)
      end
    end
  end

  feature 'uploading valid resumes' do
    render_views

    scenario 'after logging in, uploads a valid resume' do
      user = create(:regular)
      visit '/users/sign_in'
      fill_in 'user_email', with: 'regular@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit profile_resumes_path(user)
      attach_file 'resume_attachment', Rails.root + 'spec/files/testresumes/valid.pdf'
      fill_in 'resume_name', with: 'valid_resume'
      click_button 'Upload'
      expect(page).to have_content('valid_resume')
    end
  end

  feature 'uploading valid resumes' do
    render_views

    scenario 'after logging in, uploads a valid resume' do
      user = create(:regular)
      visit '/users/sign_in'
      fill_in 'user_email', with: 'regular@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit profile_resumes_path(user)
      attach_file 'resume_attachment', Rails.root + 'spec/files/testresumes/valid.pdf'
      fill_in 'resume_name', with: 'valid_resume'
      click_button 'Upload'
      expect(page).to have_content('valid.pdf')
    end
  end

  feature 'uploading invalid resumes' do
    render_views

    scenario 'after logging in, uploads a valid resume' do
      user = create(:regular)
      visit '/users/sign_in'
      fill_in 'user_email', with: 'regular@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit profile_resumes_path(user)
      attach_file 'resume_attachment', Rails.root + 'spec/files/testresumes/invalid.pdf'
      fill_in 'resume_name', with: 'valid_resume'
      click_button 'Upload'
      expect(page).not_to have_content('invalid.pdf')
    end
  end
end
