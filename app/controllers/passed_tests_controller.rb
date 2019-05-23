class PassedTestsController < ApplicationController

  before_action :set_passed_test, only: %i[show update result gist]

  def show ;end

  def result ;end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      TestsMailer.completed_test(@passed_test).deliver_now
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  def gist
    gist_service = GistQuestionService.new(@passed_test.current_question)
    result = gist_service.call
    gist_url = result.html_url

    flash_options = if gist_service.success?
                      current_user.gists.create(question: @passed_test.current_question,
                                                url: gist_url)
                      { notice: t('.success', url: gist_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @passed_test, flash_options
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
