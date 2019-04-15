class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def show; end

  def index
    @question = @test.questions
    render inline: '<% @question.each { |q| %><p><%= q.body %></p><% } %>'
  end

  def new; end

  def create
    @test.questions.create(params_question)
    render inline: '<h1>Question created</h1>'
  end

  def destroy
    @question.destroy
    render inline: '<h1>Question deleted</h1>'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def params_question
    params.require(:question).permit(:body)
  end

  def rescue_from_question_not_found
    render plain: 'Request not found'
  end

end
