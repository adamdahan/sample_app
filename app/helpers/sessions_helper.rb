module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  #  we’ll follow a common Ruby convention by storing the result of User.find_by in an instance variable, which hits the database the first time but returns the instance variable immediately on subsequent invocations
  def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end

    # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
