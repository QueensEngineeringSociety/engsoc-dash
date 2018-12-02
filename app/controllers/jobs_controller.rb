# frozen_string_literal: true

class JobsController < ApplicationController
  include UserHelper

  load_and_authorize_resource

  skip_authorize_resource only: %i[new create]

  before_action :set_job, only: %i[show assign destroy edit update]

  # GET /organizations/:organization_id/jobs/new
  def new
    @job = Job.new
    @organization = Organization.find(params[:organization_id])
    unless superadmin?(current_user) || managed_orgs(current_user).include?(@organization)
      flash[:warning] = "Can't create a new job for an organization you don't manage."
      redirect_back(fallback_location: organizations_path)
    end
  end

  # POST /organizations/:organization_id/jobs/new
  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = 'Job Successfully Created!'
      redirect_to assign_job_path(@job.id)
    else
      flash.keep[:danger] = 'Could Not Save Job!'
      flash[:danger] << '<li>' + @job.errors.full_messages.join('</li><li>')
      flash[:danger] << '</ul>'
      redirect_to new_organization_job_path
    end
  end

  # GET /jobs/:id
  def show
    @organization = @job.organization
    if @organization.status != 'active' && !superadmin?(current_user)
      flash[:warning] = 'The job ' + @job.title + ' cannot be viewed because its organization, ' + @organization.name + ' is not active.'
      redirect_back(fallback_location: organizations_path)
    end
    # @users = @job.user
  end

  # GET /jobs/:id/edit
  def edit; end

  # PUT /jobs/:id
  def update
    if @job.update_attributes(job_params)
      flash[:success] = 'Job Updated'
      redirect_to job_path(@job)
    else
      render 'edit'
    end
  end

  # DELETE /jobs/:id
  def destroy
    @job.destroy
    redirect_to organization_path(@job.organization_id)
  end

  # GET /jobs/:id/assign
  def assign; end

  # POST /jobs/:id/create_position
  def create_position
    pos_params = position_params
    usr = User.find_by(email: pos_params[:user_id].downcase)
    if usr.blank?
      flash.keep[:warning] = 'Could not find a user by that email, make sure you have spelt the email right, and that they have signed onto DASH at least once, and try again.'
      redirect_back(fallback_location: user_organizations_path)
    else
      pos_params[:user_id] = usr.id
      @position = Position.new(pos_params)
      if @position.save
        user = User.find(@position.user_id)
        job = Job.find(@position.job_id)
	flash[:success] = user.first_name.to_s + ' ' + user.last_name.to_s + ' assigned as ' + job.title.to_s + ' from ' + @position.start_date.to_date.to_s + ' to ' + @position.end_date.to_date.to_s
        redirect_to :back
      else
        flash.keep[:danger] = 'Could Not Save Position'
        flash[:danger] << '<li>' + @position.errors.full_messages.join('</li><li>')
        flash[:danger] << '</ul>'
        redirect_to assign_job_path
      end
    end
  end

  # PUT /jobs/:id/add_user
  def add_user
    user = User.find(job_params[:user_id])
    @job.users << user
  end

  private

  def job_params
    params.require(:job).permit(:title, :organization_id, :description, :role, :job_type, user_ids: [])
  end

  def position_params
    params.require(:position).permit(:job_id, :user_id, :start_date, :end_date)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
