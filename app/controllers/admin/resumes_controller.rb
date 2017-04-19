class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  layout 'admin'

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.order("updated_at DESC")
  end

  def require_is_admin
    if !current_user.is_admin
      redirect_to admin_jobs_path, alert:"You are not admin"
    end
  end

end
