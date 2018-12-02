# frozen_string_literal: true

class JobPostingAnswersController < ApplicationController
  # TODO: write a check to for no params created - in case there are no job questions associated with the job posting!

  # load_and_authorize_resource

  before_action :set_job_application, only: %i[edit destroy]
  before_action :clear_cache, only: [:new]

  # GET /job_posting/:job_posting_id/job_application/:job_application_id/job_posting_answers/new
  def new
    @job_posting = JobPosting.find(params[:job_posting_id])
    @job_application = JobApplication.find(params[:job_application_id])
    if @job_application.user_id != current_user.id
      flash[:warning] = "You don't have the permission to do that."
      redirect_back(fallback_location: root_path)
    elsif @job_application.status != 'draft'
      flash[:warning] = 'Cannot edit non-draft job posting answers.'
      redirect_back(fallback_location: root_path)
    elsif @job_application.job_posting_answers.exists?
      redirect_to edit_job_application_job_posting_answers_path
    end
    @all_questions = @job_posting.job_posting_questions.all
    @page_answers = []
    @job_posting.job_posting_questions.count.times do
      @page_answers << JobPostingAnswer.new
    end
  end

  # POST /job_posting/:job_posting_id/job_application/:job_application_id/job_posting_answers
  def create
    if params.key?('answer') || params.key?('answers')
      if params.key?('answer')
        @answer = JobPostingAnswer.create(answer_params(params['answer']))
      else
        params['answers'].each do |_key, answer|
          @answer = JobPostingAnswer.create(answer_params(answer))
        end
      end
      @job_application_id = @answer.job_application_id
      redirect_to finalize_job_application_path(id: @job_application_id)
    else
      redirect_to finalize_job_application_path(id: params[:job_application_id])
    end
  end

  # GET /job_applications/:job_application_id/job_posting_answers/edit
  def edit
    @job_application = JobApplication.find(params[:job_application_id])
    @job_posting = @job_application.job_posting
    if @job_application.user_id != current_user.id
      flash[:warning] = "You don't have the permission to do that."
      redirect_back(fallback_location: root_path)
    elsif @job_application.status != 'draft'
      flash[:warning] = 'Cannot edit non-draft job posting answers.'
      redirect_back(fallback_location: root_path)
    elsif !@job_application.job_posting_answers.exists?
      @job_posting = JobPosting.find(@job_application.job_posting_id)
      redirect_to new_job_posting_job_application_job_posting_answers_path(job_posting_id: @job_posting.id)
    end
    @job_posting_answers = JobPostingAnswer.where(job_application_id: @job_application.id).all
  end

  # PUT /job_applications/:job_application_id/job_posting_answers/:id
  def update
    params['answers'].each do |_key, answer|
      @answer = JobPostingAnswer.find(answer[:id])
      @answer.update_attributes(answer_params(answer))
    end
    @job_application_id = @answer.job_application_id
    redirect_to finalize_job_application_path(id: @job_application_id)
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:job_application_id])
  end

  def answer_params(my_params)
    my_params.permit(:content, :job_posting_questions_id, :job_application_id, :id)
  end

  def clear_cache
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end
end
