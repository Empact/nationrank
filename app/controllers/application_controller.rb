class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authenticated
    flash.notice = "You'll need to sign in for that."
    redirect_to new_user_session_path
  end
end
