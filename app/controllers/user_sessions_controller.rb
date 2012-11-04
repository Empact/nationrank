class UserSessionsController < ApplicationController
  def new
  end

  def create
    if user = login(params[:username], params[:password])
      flash.notice = 'Welcome back!'
      redirect_back_or_to root_path
    else
      flash.alert = 'We had trouble with that - try again?'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
