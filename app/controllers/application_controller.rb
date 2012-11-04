class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authenticated
    flash.notice = "You'll need to sign in for that."
    redirect_to new_user_session_path
  end

  def load_report
    @report = Report.find(params[:report_id])
  end

  def load_publication
    load_report
    @publication = @report.publications.find(params[:publication_id])
  end
end
