# frozen_string_literal: true

class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[show destroy edit update]

  def index
    if cannot? :manage, :all
      flash[:warning] = 'This page cannot be viewed.'
      redirect_back(fallback_location: root_path)
    else
      @users = User.paginate(page: params[:page], per_page: 30).order(:last_name)
    end
  end

  def show
    @user
  end

  def edit
    @user
  end

  def update
    p @user.update_attributes(user_params)
    p user_params
    p user_params.key?(:email_notifications)
    if @user.update_attributes(user_params)
      # flash[:success] = "Your changes have been saved."
      if user_params.key?(:email_notifications)
        # redirect_to controller: 'users', action: 'settings', user_id: @user.id
        redirect_back(fallback_location: profile_path)
      else
        redirect_to controller: 'users', action: 'show', id: @user.id
      end
      # redirect_back(fallback_location: profile_path)
    else
      flash[:warning] = 'Your changes could not be saved.'
      render 'edit'
    end
  end

  def settings
    @user = User.find(params[:profile_id])
    if @user.id != current_user.id
      flash[:warning] = 'Page not accessible.'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :preferred_name, :tagline, :bio, :faculty, :specialization, :gender, :email_notifications, :phone_number)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
