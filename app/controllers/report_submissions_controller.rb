class ReportSubmissionsController < ApplicationController
  def new
    @report = Report.new
    @report.build_organization
    @report.publications.new
  end
end
