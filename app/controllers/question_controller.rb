class QuestionController < ApplicationController
  before_action :logged_in_user, only: [ :addQuestion]


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


  def addQuestion
    @users_question = Question.new(status:"new", user_id: current_user.id, question: params[:addQuestion][:question])
    if @users_question.save
         add_tag(params)
         debugger
      redirect_to home_path
    else
      flash[:info] = " Question exists"
      redirect_to home_path
    end
  end


  def add_tag(params)
    if !params[:addQuestion][:tags].nil?
      @tags = params[:addQuestion][:tags].split(" ")
      @tags.each do |tag|
        t= Tag.new(tag_name:tag)
        t.save!
        @users_question.tags << t
      end
    end
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


  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to home_path
    else
       render 'show'
    end
  end


  end
