class JobPostingsController < ApplicationController

  # before any action gets fired set the job posting
  before_action :set_job_posting, only: [:show, :destroy, :edit, :update, :approve, :withdraw]

  # define the helper for the controller
  helper :application

  def index
    # retrieve only the
    @open_job_postings = JobPosting.where(status: "open").order(:deadline).paginate(:page => params[:page], :per_page => 5)
    @approval_job_postings = JobPosting.where(status: 0)
    @interviewing_job_postings = JobPosting.where(status: 2).order(:deadline)
    @closed_job_postings = JobPosting.where(status: 3).order(:deadline)
  end

  def show
    @organization = Organization.find_by! id: @jobposting.organization_id
  end

  def create
    @jobposting = JobPosting.new(job_postings_params)
    if @job_posting.save
      redirect_to job_postings_path
      # redirect_to controller: 'job_postings', action: 'show', id: @job.organization.id
    else
      render 'new'
    end
  end

  def new
    @jobposting = JobPosting.new
  end

  def approve
    @jobposting.status = "open"
    @jobposting.save
    redirect_to job_postings_path
  end

  def withdraw
    @jobposting.status = "waiting_approval"
    @jobposting.save
    redirect_to job_postings_path
  end

  private

  # define the jpbs parameters
    def job_postings_params
      params.require(:job_posting).permit(:creator_id, :title, :description, :organization_id, :deadline, :status)
    end

    def set_job_posting
      @jobposting = JobPosting.find(params[:id])
    end
end
