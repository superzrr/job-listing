class ResumesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy]

  def index
  end

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user

    if @resume.save
      redirect_to job_path(@job), notice:"The resume has been uploaded"
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to admin_jobs_path
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
