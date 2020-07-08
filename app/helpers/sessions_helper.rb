module SessionsHelper
  def log_in(user)
    session[:user_id] = user
    session[:expires_at] = Time.current + 60.minutes
  end

  def logged_in?
   if !current_user.nil?
     if Session.find_by(authentication_token: session[:user_id]).status == 1
       return true
     else
       return false
     end
   end
  end

  def forget(user)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def current_user
    if (user_id = session[:user_id])
      if Session.exists?(authentication_token: user_id)
        @current_user ||= User.find(Session.find_by(authentication_token: user_id).user_id)
      end
    end
  end

  def log_out
    s = Session.find_by(authentication_token:session[:user_id])
    s.update(status:0)
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end