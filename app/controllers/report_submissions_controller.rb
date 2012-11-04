class ReportSubmissionsController < ApplicationController
  def new
    @report = Report.new(params.permit(report: :organization_id))
    if @report.organization
      @organization = @report.organization
    else
      @report.build_organization
    end
    @report.publications.new
  end

  def create
    @report = Report.new(report_submission_params.merge(created_by: current_user))
    if @report.save
      flash.notice = "Successfully created report!"
      redirect_to report_path(@report)
    else
      flash.alert = 'We had a problem with that.'
      render :new
    end
  end

  private

  def report_submission_params
    params.require(:report).permit(:organization_id, :name, :url, :description)
  end
end
