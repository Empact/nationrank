class ReportsController < ApplicationController
  def index
    @reports = Report.page(params[:page])
  end
end
