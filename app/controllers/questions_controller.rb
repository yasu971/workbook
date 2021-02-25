class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def index2
    @questions = Question.all
  end
  
  def new
    @question = Question.new
  end

  def answer
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    @comments = @question.comments.includes(:user)
  end

  def edit
    @question = Question.find(params[:id])
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path
    else
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.destroy
      redirect_to root_path
    end
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content, :option1, :option2, :option3, :option4, :answer, :commentary).merge(user_id: current_user.id)
  end
  
end