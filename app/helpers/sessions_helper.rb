module SessionsHelper

  #  Logs in the given user.
  def log_in(user)
    # put a cookies in the browser with encrypt
    session[:user_id] = user.id

  end

  # Returns the current logged-in user (ia any)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # @current_user = @curent_user || User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwais.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def logouts
    session.delete(:user_id)
    @current_user = nil
  end
end
