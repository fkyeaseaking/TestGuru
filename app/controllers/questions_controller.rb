class QuestionsController < ApplicationController
  before_action :find_test, except: %i[show edit update destroy]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @test = @question.test
    @question.destroy

    redirect_to test_questions_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:body, :answer)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
