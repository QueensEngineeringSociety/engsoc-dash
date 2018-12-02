# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def new
      logout_url = 'https://login.queensu.ca/idp/profile/Logout'

      # SSO login
      if Rails.env.production?
        user_email = request.headers['HTTP_EMAIL']
        user_given_name = request.headers['givenName']
        user_surname = request.headers['surname']

        if user_email.blank?
          Rails.logger.debug 'Could not find email, logging user back out'
          redirect_to logout_url
        end

        if user_given_name.blank?
          Rails.logger.debug 'Could not get first name, but continue trying to login in any way with default name'
          user_given_name = 'Firstname'
        end

        if user_surname.blank?
          Rails.logger.debug 'Could not get last name, but continue trying to login in any way with default name'
          user_given_name = 'Lastname'
        end

        if user = User.where(email: user_email).first
          Rails.logger.debug 'User found'
          sign_in(:user, user)
          flash[:success] = 'Welcome to Dash'
          flash.delete(:notice)
          redirect_to root_path
        else
          Rails.logger.debug 'Creating user'
          new_user = User.new(
            email: user_email,
            first_name: user_given_name,
            last_name: user_surname
          )
          if new_user.save!
            Rails.logger.debug 'User saved'
            sign_in(:user, new_user)
            flash[:success] = 'Welcome to Dash!'
            flash.delete(:notice)
            redirect_to root_path
          else
            Rails.logger.debug 'User Creation Failure'
            redirect_to logout_url
          end
        end

      else
        Rails.logger.debug 'default session path'
        super
      end
    end
  end
end
