# frozen_string_literal: true

class JobApplicationsController < ApplicationController
  load_and_authorize_resource

  skip_authorize_resource only: %i[filter_index filter filter_user]

  before_action :set_job_application, only: %i[show edit update destroy select_resume finalize hire decline]
  before_action :clear_cache, only: %i[index select_resume]

  # GET /job_postings/:job_posting_id/job_applications
  def index
    @job_posting = JobPosting.find(params[:job_posting_id])
    @submitted_job_applications = @job_posting.job_applications.where(status: 'submitted').where.not(archived: true)
    @interviewing_job_applications = @job_posting.job_applications.where(status: 'interview_scheduled').where.not(archived: true)
    @hired_job_applications = @job_posting.job_applications.where(status: 'hired').where.not(archived: true)
    @declined_job_applications = @job_posting.job_applications.where(status: 'declined').where.not(archived: true)
    @archived_job_applications = @job_posting.job_applications.where(archived: true).order('id').reverse_order
  end

  # GET /job_postings/:job_posting_id/job_applications/new
  def new
    @job_posting = JobPosting.find(params[:job_posting_id])
    if @job_posting.status != 'open'
      flash[:warning] = 'This job posting is currently not taking applications.'
      redirect_to :back
    else
      @existing = JobApplication.find_by(user_id: current_user.id, job_posting_id: params[:job_posting_id], archived: false)
      if @existing
        if @existing.status == 'submitted'
          flash[:warning] = 'It seems like you have already applied for this job.'
          redirect_to job_posting_path(@job_posting)
        elsif @existing.status == 'draft'
          # redirect_to new_job_posting_job_application_job_posting_answers_path(:job_application_id => @existing.id)
          redirect_to select_resume_job_application_path(@existing)
        end
      end
      @job_application = JobApplication.new
    end
  end

  # POST /job_postings/:job_posting_id/job_applications
  def create
    @job_application = JobApplication.new(job_application_params)
    @job_posting = JobPosting.find(params[:job_posting_id])
    if @job_application.save
      # redirect_to new_job_posting_job_application_job_posting_answers_path(:job_application_id => @job_application.id)
      redirect_to select_resume_job_application_path(@job_application)
    else
      render 'new'
    end
  end

  # GET /job_applications/:id
  def show
    @job_applications = JobApplication.where(job_posting_id: @job_application.job_posting_id).where(status: @job_application.status)
  end

  # GET /job_applications/:id/finalize
  def finalize
    @job_application = JobApplication.find(params[:id])
    @all_questions = @job_application.job_posting.job_posting_questions.all
    @job_posting_answers = JobPostingAnswer.where(job_application_id: @job_application.id)
  end

  # PUT /job_applications/:id
  def update
    if @job_application.update_attributes(job_application_params)
      flash[:success] = 'Job Application Successfully Submitted!'
      UserMailer.submit_job_application(@job_application).deliver_now
      redirect_to user_job_applications_path
    else
      render 'finalize'
    end
  end

  # DELETE /job_applications/:id
  def destroy
    @job_application.destroy
    redirect_to job_posting_job_applications_path
  end

  # GET /job_applications/user
  def user
    @user_job_applications = JobApplication.where(user_id: current_user.id).order(:id).filter(params.slice(:status))
  end

  # GET /job_applications/:id/select_resume
  def select_resume
    @resumes = Resume.where(user_id: current_user.id).all
    @job_posting = @job_application.job_posting
  end

  # PATCH /job_applications/:id/select_resume
  def update_resume
    if @job_application.update_attributes(resume_select_params)
      # flash[:success] = "Job Application Successfully Submitted!"
      redirect_to new_job_posting_job_application_job_posting_answers_path(job_application_id: @job_application.id, job_posting_id: @job_application.job_posting.id)
    else
      flash[:warning] = 'Hmm... something went wrong, please try again, or contact an Admin'
      render 'select_resume'
    end
  end

  def filter_user
    if params[:status] == 'All'
      redirect_to user_job_applications_path
    else
      redirect_to user_job_applications_path(status: params[:status])
    end
  end

  # GET /job_applications/:id/hire
  def hire
    @job_application.status = 'hired'
    job_posting = @job_application.job_posting

    job = job_posting.job
    user = User.find(@job_application.user_id)

    position = Position.new(job_id: job.id, user_id: user.id, start_date: job_posting.start_date, end_date: job_posting.end_date)

    @job_application.save
    position.save

    # May 27th 2018, preferring manual email notifications for hired or declined
    # uncomment the line below when wishing to automatically send notification emails
    # UserMailer.hire_job_application(@job_application).deliver_now
    flash[:success] = 'Hired ' + user.first_name + ' ' + user.last_name + ' for ' + job.title
    redirect_to :back
  end

  # GET /job_applications/:id/decline
  def decline
    @job_application.status = 'declined'
    @job_application.save
    # May 27th 2018, preferring manual email notifications for hired or declined
    # UserMailer.decline_job_application(@job_application).deliver_now
    redirect_to :back
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def job_application_params
    params.require(:job_application).permit(:user_id, :job_posting_id, :status, :resumes_id, job_posting_answers: %i[id content])
  end

  def resume_select_params
    params.require(:job_application).permit(:resumes_id)
  end

  def clear_cache
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end
end
