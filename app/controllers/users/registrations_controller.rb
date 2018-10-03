# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]

    def new
      super
    end

    private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
