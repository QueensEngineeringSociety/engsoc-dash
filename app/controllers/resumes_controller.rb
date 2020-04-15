# frozen_string_literal: true

class ResumesController < ApplicationController
  load_and_authorize_resource
  before_action :set_resume

  # GET profiles/:profile_id/resumes
  #When you click on Profile->resumes the page that appears is controlled by index
  def index
    if @user.id == current_user.id
      @resume = Resume.new
    else
      flash[:danger] = "You don't have access to that."
      redirect_back(fallback_location: root_path)
    end
  end

  # POST profiles/:profile_id/resumes
  #When you click on the upload button
  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      flash[:success] = "Resume <em>#{@resume.name}</em> has been uploaded."
      redirect_to profile_resumes_path
    else
      #if the resume won't upload or if one isn't selected then this else statement is activated
      flash[:warning] = "Resume <em>#{@resume.name}</em> did not upload properly. Please make sure you have attached a file of the right format (PDF, DOC, DOCx) of under 2MB, and that you have given it a name, and try again."
      render 'index'
    end
  end

  # DESTROY profiles/:profile_id/resumes/:resume_id
  #For when the user deletes a resume
  def destroy
    resume = Resume.find(params[:id])
    resume.destroy
    flash[:success] = 'Resume Successfully Deleted'
    redirect_to profile_resumes_path
  end

  private

  def resume_params
    params.require(:resume).permit(:name, :attachment, :user_id)
  end

  def set_resume
    @user = User.find(params[:profile_id])
    @resumes = @user.resumes.all
  end
end
