# frozen_string_literal: true

class OrganizationsController < ApplicationController
  load_and_authorize_resource

  skip_authorize_resource only: %i[filter_index filter_user]

  before_action :set_organization, only: %i[show destroy edit update approve withdraw archive]

  # GET /organizations
  def index
    @organizations = Organization.where(status: 'active').filter(params.slice(:department)).paginate(page: params[:page], per_page: 20)
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:success] = 'Organization Successfully Created!'
      redirect_to controller: 'organizations', action: 'show', id: @organization.id
    else
      render 'new'
    end
  end

  # GET /organizations/:id
  def show
    if @organization.status != 'active' && !superadmin(current_user)
      flash[:danger] = 'This organization is currently not open (has not been approved or has been archived), and therefore cannot be viewed. Please contact support if you feel this has been done in error.'
      redirect_back(fallback_location: organizations_path)
    end
    @jobs = @organization.jobs.order(role: :desc, title: :asc)
  end

  # GET /organizations/:id/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # PUT /organizations/:id
  def update
    if @organization.update_attributes(organization_params)
      flash[:success] = 'Organization Successfully Updated!'
      redirect_to controller: 'organizations', action: 'show', id: @organization.id
    else
      render 'edit'
    end
  end

  # DELETE /organizations/:id
  def destroy
    @organization.destroy
    flash[:success] = 'Organization Successfully Deleted!'
    redirect_to organizations_url
  end

  # GET /organizations/admin
  def admin
    @organizations = Organization.filter(params.slice(:status, :department)).paginate(page: params[:page], per_page: 10)
  end

  # GET /organizations/user
  def user; end

  # GET /organizations/:id/approve
  def approve
    @organization.status = 'active'
    @organization.save
    redirect_to admin_organizations_path
  end

  # GET /organizations/:id/withdraw
  def withdraw
    @organization.status = 'waiting_approval'
    @organization.save
    redirect_to admin_organizations_path
  end

  # GET /organizations/:id/archive
  def archive
    @organization.status = 'archived'
    @organization.save
    redirect_to admin_organizations_path
  end

  def filter
    if params[:status] == 'All' && params[:department] == 'All'
      redirect_to admin_organizations_path
    elsif params[:status] != 'All' && params[:department] == 'All'
      redirect_to admin_organizations_path(status: params[:status])
    elsif params[:status] == 'All' && params[:department] != 'All'
      redirect_to admin_organizations_path(department: params[:department])
    else
      redirect_to admin_organizations_path(status: params[:status], department: params[:department])
    end
  end

  def filter_manage
    if params[:status] == 'All' && params[:department] == 'All'
      redirect_to manage_organizations_path
    elsif params[:status] != 'All' && params[:department] == 'All'
      redirect_to manage_organizations_path(status: params[:status])
    elsif params[:status] == 'All' && params[:department] != 'All'
      redirect_to manage_organizations_path(department: params[:department])
    else
      redirect_to manage_organizations_path(status: params[:status], department: params[:department])
    end
  end

  def filter_index
    if params[:department] == 'All'
      redirect_to organizations_path
    else
      redirect_to organizations_path(department: params[:department])
    end
  end

  def filter_user
    if params[:department] == 'All'
      redirect_to user_organizations_path
    else
      redirect_to user_organizations_path(department: params[:department])
    end
  end

  def manage
    @managing_jobs = Job.includes(:positions).where(positions: { user_id: current_user.id })
    @managed_organizations = Organization.includes(:jobs).where(jobs: { id: @managing_jobs.ids, role: %w[management admin] }).filter(params.slice(:status, :department)).paginate(page: params[:page], per_page: 10)
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :email, :status, :department)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
