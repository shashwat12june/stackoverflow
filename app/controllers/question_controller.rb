class QuestionController < ApplicationController
  before_action :logged_in_user, only: [ :add_question]


  def index
    @question = Question.paginate(page: params[:page])
  end


  def show
    if ((!Question.exists?(params[:id])))
      render plain: 'Question not found'
    else
    @question = Question.find(params[:id])
    end
  end


  def add_question
    @users_question = Question.new(status:"new", user_id: current_user.id, question: params[:addQuestion][:question])
    if @users_question.save
      if !params[:addQuestion][:tags].nil?
         tag_service.add_tag
         end
      redirect_to home_path
    else
      flash[:info] = " Question exists"
      redirect_to home_path
    end
  end


  def tag_service
    Tag_service.new(getParams)
  end


  def edit
    @question = Question.find(params[:id])
  end


  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question: params[:question][:question])
      flash[:success] = "Question updated"
      redirect_to question_path(@question.id)
    else
      render 'edit'
    end
  end


  def getParams
    @params = {users_question: @users_question, tag:params[:addQuestion][:tags]}
  end


  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to home_path
    else
       render 'show'
    end
  end

end
