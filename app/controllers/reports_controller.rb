class ReportsController < ApplicationController
  def index
    @reports = Report.page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
  end
end
