class SessionsController < ActionController::Base
  layout "application"

  def show
  end

  def create
    user = User.find_by(email_address: session_params[:email_address])
    if user.authenticate(session_params[:password])
      session = user.sessions.create
      cookies.encrypted[:code] = session.code
      redirect_to root_path
    end
  end

  def destroy
    Session.find_by(code: cookies.encrypted[:code]).destroy
    redirect_to new_session_path
  end

  def session_params
    params.require(:user).permit(:email_address, :password)
  end
end
