# frozen_string_literal: true

class JobPostingQuestionsController < ApplicationController
  load_and_authorize_resource
  # before any action gets fired set the job posting
  before_action :set_job_posting_questions

  # GET /job_postings/:job_posting_id/job_posting_questions
  def index
    @jobpostingquestion = JobPostingQuestion.new
  end

  # POST /job_postings/:job_posting_id/job_posting_questions
  def create
    if @jobposting.status != 'waiting_approval'
      flash[:danger] = "The Job Posting is currently not 'waiting approval', so questions cannot be created, deleted, or editted. Please contact an administrator if you require assistance."
      redirect_to :back
    else
      @jobpostingquestion = JobPostingQuestion.new(job_posting_question_params)
      if @jobpostingquestion.save
        redirect_to job_posting_job_posting_questions_path
      else
        flash[:danger] = 'The Job Posting question was not saved. Please try again, or contact an administrator.'
        redirect_to :back
      end
    end
  end

  # UPDATE /job_postings/:job_posting_id/job_posting_questions
  def update
    if @jobposting.status != 'waiting_approval'
      flash[:danger] = "The Job Posting is currently not 'waiting approval', so questions cannot be created, deleted, or editted. Please contact an administrator if you require assistance."
      redirect_to :back
    else
      question = JobPostingQuestion.find(job_posting_question_params[:id])
      if question.update_attributes(job_posting_question_params)
        flash[:success] = 'Job Posting Question Successfully Updated'
      else
        flash[:danger] = 'Job Posting Question not updated (question too short, must be at least 5 characters)'
      end
      redirect_to job_posting_job_posting_questions_path(job_posting_id: @questions.first.job_posting.id)
    end
  end

  # DESTROY /job_posting_questions/:id
  def destroy
    if @jobposting.status != 'waiting_approval'
      flash[:danger] = "The Job Posting is currently not 'waiting approval', so questions cannot be created, deleted, or editted. Please contact an administrator if you require assistance."
      redirect_to :back
    else
      @question = JobPostingQuestion.find(params[:id])
      @question.destroy
      flash[:success] = 'Job Posting Question Successfully Deleted!'
      redirect_to job_posting_job_posting_questions_path(job_posting_id: @question.job_posting.id)
    end
  end

  private

  def job_posting_question_params
    params.require(:job_posting_question).permit(:content, :job_posting_id, :id)
  end

  def set_job_posting_questions
    @jobposting = JobPosting.find(params[:job_posting_id])
    @questions = @jobposting.job_posting_questions.all
  end
end
