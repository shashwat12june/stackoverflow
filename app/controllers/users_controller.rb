class UsersController < ApplicationController

  before_action :logged_in_user, only: [ :edit, :update, :destroy, :show]

  def index
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:success] = "Welcome to the StackOverflow!"
        format.html { redirect_to login_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @user=User.find(params[:id])
    if !@user
      render json: {
          error: "User with id #{params[:id]} not found."
      }, status: :not_found
    end
  end


  def home
    if  params[:search]
      @question = Question.where("question LIKE ?", "%#{params[:search][:search]}%").paginate(page: params[:page], per_page:20)
      @related_questions = search(params[:search][:search])
    else
      @question = Question.paginate(page: params[:page], per_page:20)
    end
  end


  def search(str)
    @related_questions = []
    array = str.split(" ")
    array.each do |tag|
      if Tag.exists?(tag_name:tag)
        t = Tag.find_by(tag_name:tag)
        @ques = t.questions
        @ques.each do |ques|
          @related_questions.push(ques)
        end
      end
    end
    #debugger
    return @related_questions
  end


  def edit
    if (logged_in? && current_user.id==params[:id].to_i)
      @user=User.find(params[:id])
    else
      render plain: 'invalid access'
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      @sessions = Session.where(user_id: @user.id)
      @sessions.each do |session|
        session.update(status:0)
      end
      log_out
      redirect_to root_path
    else
      render 'edit'
    end
  end


  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                 :email, :phone_number,
                                 :password, :password_confirmation)
  end


  def error_view
    render plain: "Url not found"
  end


end
