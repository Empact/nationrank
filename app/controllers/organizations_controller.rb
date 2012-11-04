class OrganizationsController < ApplicationController
  layout 'modal', only: :new
  before_filter :require_login, only: [:new, :create]

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params.merge(created_by: current_user))
    if @organization.save
      flash.notice = "Created!"
      params[:return_to] << "?organization_id=#{@organization.id}" if params[:return_to]
    else
      flash.alert =
        "We had trouble with that: #{@organization.errors.full_messages.to_sentence}"
    end
    redirect_to params[:return_to] || :back
  end

  def show
    @organization = Organization.find(params[:id])
    @reports = @organization.reports
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :short_name, :slogan, :url)
  end
end
