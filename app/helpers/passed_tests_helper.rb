module PassedTestsHelper

  def success_percentage_result_message(passed_test)
    if passed_test.passed?
      result_status = 'success'
      message = 'SUCCESS! Test was completed!'
    else
      result_status = 'fail'
      message = 'FAIL! Please try again.'
    end

    result_body = [div_percentage_helper(passed_test.success_percentage, result_status),
                   content_tag(:p, message)]

    result_body.join.html_safe
  end

  def div_percentage_helper(number, result_status)
    content_tag(:div, class: "percentage #{result_status}") do
      number_to_percentage(number, precision: 0)
    end
  end

  def header_current_question(passed_test)
    content_tag(:p) do
      "Current Question: #{passed_test.current_question_number} / #{passed_test.total_questions}"
    end
  end

end