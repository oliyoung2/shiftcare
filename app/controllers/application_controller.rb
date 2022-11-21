class ApplicationController < ActionController::Base
  before_action :require_session

  def require_session
    unless has_current_session?
      flash[:error] = t("session.no_current_session")
      redirect_to new_session_path
    end
  end

  def has_current_session?
    current_session && current_user
  rescue
    false
  end

  def current_session
    Session.find_by(code: cookies.encrypted[:code])
  end

  def current_user
    current_session.user
  end
end
