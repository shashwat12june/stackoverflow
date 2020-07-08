class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  include Concerns::Errors
  include Concerns::ErrorHandler

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please login'.freeze
      redirect_to login_url
    end end

  def session_timeout
    if session[:expires_at].to_time < Time.current
      log_out
    end
  end
end
