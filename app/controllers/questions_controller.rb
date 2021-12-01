class QuestionsController < ApplicationController
  before_action :find_test, except: %i[show]
  before_action :find_question, only: %i[show destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render json: @test.questions
  end

  def show
    render json: @question
  end

  def new; end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      render plain: @question.inspect
    else
      render plain: "question wasn't created"
    end
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
