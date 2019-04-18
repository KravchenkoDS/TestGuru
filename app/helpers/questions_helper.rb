=begin
module QuestionsHelper
  def question_header(question)
    header = question.persisted? ? "Edit " : "Create new "
    header + "#{question.test.name} #{level_test(question.test)} test question."
  end
end
=end

module QuestionsHelper
  def question_header(question)
    test_name = question.test.name

    name = if question.new_record?
             "Create New #{test_name} Question"
           else
             "Edit #{test_name} Question"
           end

    content_tag('h1', name)
  end
end