# frozen_string_literal: true

#This controller controls the User Profile Page that appears when the user wants to view their profile (top right button on dash). Check out views/users for the html

class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[show destroy edit update]

  #This is only available to Admins. To access this page clikc on Admin->Users. See views/users/index.html.erb
  def index
    if cannot? :manage, :all
      flash[:warning] = 'This page cannot be viewed.'
      redirect_back(fallback_location: root_path)
    else
      #This is controlling the searchbar at the top of the Admin Users Page
    	@users = User
			.where("UPPER(\"users\".\"first_name\") LIKE UPPER(:query) OR
				UPPER(\"users\".\"last_name\") LIKE UPPER(:query)",
				{query: "%#{params[:query]}%"})
			.paginate(page: params[:page], per_page: 30)
			.order(:last_name)
    end
  end

  #UsersController#show is what first appears when you click on the profile button. See show.html.erb
  def show
    @user
  end

  #When the edit button is clicked. See views/users/edit.html.erb
  def edit
    @user
  end

  #This runs when the user clicks on 'Submit' after editing their profile
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

  #When you click on 'Manage Settings' See settings.html.erb
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
