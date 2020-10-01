module SessionsHelper

  #  Logs in the given user.
  def log_in(user)
    # put a cookies in the browser with encrypt
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent sesson.
  def remember(user)
    user.remember
    # cookies[:user_id] = { value: user.id,
    #                       expires: 20.years.from_now.utc }
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (ia any)
  def current_user
    # logger.debug "session.user_id: #{session[:user_id]}"
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
      # @current_user = @curent_user || User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      # raise
      # logger.debug "cookies.signed.user_id: #{user_id}"
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwais.
  def logged_in?
    !current_user.nil?
  end

  # Forgets a user in a persistent sesson.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
