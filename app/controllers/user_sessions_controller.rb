class UserSessionsController < ApplicationController
  layout 'modal'

  def new
  end

  def create
    if user = login(params[:username], params[:password])
      flash.notice = 'Welcome back!'
    else
      flash.alert = 'We had trouble with that - try again?'
    end
    redirect_to :back
  end

  def destroy
    logout
    redirect_to root_path
  end
end
