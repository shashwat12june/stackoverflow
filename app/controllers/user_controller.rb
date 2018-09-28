class UserController < ApplicationController
  before_action :logged_in_user, :session_timeout, only: [ :edit, :update, :destroy, :show, :addQuestion]
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:success] = "Welcome to the demo App!"
        format.html { redirect_to login_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    if ((!Question.exists?(params[:id])))
      render plain: 'Question not found'
    else
    @user=User.find(params[:id])
    end
  end

  def edit
    if (current_user.id==params[:id].to_i)
      @user=User.find(params[:id])
    else
      render plain: 'invalid access'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end


  def home
  if  params[:search]
    @questions = Question.where("question LIKE ?", "%#{params[:search][:search]}%")
  else
    @questions = Question.all
  end
  end

  def errorView
    render plain: "Url not found"
  end

end
