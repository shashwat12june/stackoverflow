class SessionsController < ApplicationController
before_action :check_login, only: :new

  def new
  end

  def encrypt_password(id)
    @salt = BCrypt::Engine.generate_salt
    @token= BCrypt::Engine.hash_secret(id, @salt)
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      token = encrypt_password(user.id)
      log_in token
      session_token = Session.new(user_id:user.id, authentication_token:token, status:1)
      session_token.save!
      redirect_to home_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end


  def check_login
    if(logged_in?)
      redirect_to home_path
    else
      render 'new'
    end
  end
end
