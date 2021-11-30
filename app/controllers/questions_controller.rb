class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render json: @test.questions
  end

  def show
    render json: @test.questions.find(@question.id)
  end

  def new; end

  def create
    question = @test.questions.create(question_params)

    render plain: question.inspect
  end

  def destroy
    @question.destroy

    render plain: "Question deleted"
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
