# frozen_string_literal: true

class OrganizationsController < ApplicationController
  load_and_authorize_resource

  skip_authorize_resource only: %i[filter_index filter_user]

  before_action :set_organization, only: %i[show destroy edit update approve withdraw archive]

  # GET /organizations
  #Shows the list of organizations. If the searchbar/separtment dropdown menu is used then it filters other organizations out
  #index is for the regular organizations tab (admin is if accessed through admin tab)
  def index
    @organizations = Organization.where(status: 'active').where("UPPER(\"organizations\".\"name\") LIKE UPPER(:query) OR UPPER(\"organizations\".\"description\") LIKE UPPER(:query)", {query: "%#{params[:query]}%"}).filter(params.slice(:department)).paginate(page: params[:page], per_page: 20)
  end

  # GET /organizations/new
  #When you do Admin->Organizations->Create Organization
  def new
    @organization = Organization.new
  end

  # POST /organizations
  #Once an admin actually creates the new organization this is run
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
  #When an organization is clicked, whether it's through the admin or regular tab
  def show
    if @organization.status != 'active' && !superadmin(current_user)
      flash[:danger] = 'This organization is currently not open (has not been approved or has been archived), and therefore cannot be viewed. Please contact support if you feel this has been done in error.'
      redirect_back(fallback_location: organizations_path)
    end
    @jobs = @organization.jobs.order(role: :desc, title: :asc)
  end

  # GET /organizations/:id/edit
  #When you click on the three dots->edit for an organization
  def edit
    @organization = Organization.find(params[:id])
  end

  # PUT /organizations/:id
  #When the organization is finished being edited and the edits are saved
  def update
    if @organization.update_attributes(organization_params)
      flash[:success] = 'Organization Successfully Updated!'
      redirect_to controller: 'organizations', action: 'show', id: @organization.id
    else
      render 'edit'
    end
  end

  # DELETE /organizations/:id
  #To delete the organization
  def destroy
    @organization.destroy
    flash[:success] = 'Organization Successfully Deleted!'
    redirect_to organizations_url
  end

  # GET /organizations/admin
  #When organizations are accessed through Admin->Organizations
  def admin
    @organizations = Organization.filter(params.slice(:status, :department)).paginate(page: params[:page], per_page: 10)
  end

  # GET /organizations/user
  def user; end

#Approve, withdraw, and archive are for when an admin clicks on the three dots next to the organization name and chooses to change its status

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

  #Filter is for when the dropdown menu is used to filter the organizations shown
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