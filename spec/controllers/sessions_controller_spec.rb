# frozen_string_literal: true

require 'rails_helper'

describe UsersController do
  context 'When any user not logged in' do
    it 'redirect to sign in page' do
      get 'index'
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  context 'When superadmin user login is valid' do
    render_views
    login_superadmin
    it 'logs in user and directs them to index' do
      get 'index'
      expect(response).to render_template :index
      expect(response.body).to have_content('Admin')
    end
  end
end

feature 'Login Superadmin user' do
  scenario 'can login' do
    user = create(:superadmin)
    login_as(user, scope: :user)
    visit '/'
    expect(page).to have_content('Admin')
  end
end

feature 'Login Regular user' do
  scenario 'can login' do
    create(:student)
    visit '/users/sign_in'
    fill_in 'user_email', with: 'regular@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page).not_to have_content('Admin')
  end
end
