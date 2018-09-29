class UserController < ApplicationController

  before_action :logged_in_user, only: [ :edit, :update, :destroy, :show, :addQuestion]

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
    if ((!User.exists?(params[:id])))
      render plain: 'User not found'
    else
    @user=User.find(params[:id])
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
    return @related_questions
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


  def errorView
    render plain: "Url not found"
  end

end
