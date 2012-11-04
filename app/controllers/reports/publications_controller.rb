class Reports::PublicationsController < ApplicationController
  before_filter :require_login, only: [:new, :create]
  before_filter :load_report

  def new
    @publication = @report.publications.new
  end

  def create
    @publication = @report.publications.new(publication_params)
    if @publication.save
      flash.notice = "Thanks for the contribution! Now it's time to add some data."
      redirect_to edit_report_publication_path(@report, @publication)
    else
      flash.alert = "We had some trouble with that."
      render :new
    end
  end

  def show
    @publication = @report.publications.find(params[:id])
  end

  private

  def publication_params
    params.require(:publication).permit(:name, :url, :authors, :summary)
  end
end
