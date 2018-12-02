# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before any action make sure the user is logged in
  # if Rails.env.development?
  #   before_action :authenticate_user!
  # end
  before_action :authenticate_user!

  # before any action make sure the user has authorization
  # load_and_authorize_resource

  # if there is an exception from cancancan then we take the user to the 403 page, permission denied
  rescue_from CanCan::AccessDenied do |_exception|
    flash[:warning] = "You don't have the permission to do that."
    redirect_to root_path
  end

  private

  def after_sign_out_path_for(user)
    if Rails.env.production?
      'https://login.queensu.ca/idp/profile/Logout'
    else
      super
    end
  end
end
