module QuestionsHelper
  def question_header(question)
    header = question.persisted? ? "Edit " : "Create new "
    header + "#{question.test.name} #{level_test(question.test)} test question."
  end
end
