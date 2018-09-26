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
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def addQuestion
   @users_question = Question.new(status:"new", user_id: current_user.id, question: params[:addQuestion][:question])
   if @users_question.save
     redirect_to home_path
   end
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


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end

  def question_params
    params.require(:addQuestion).permit(:question)
  end
end
