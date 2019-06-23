module PassedTestsHelper

  def success_percentage_result_message(passed_test)
    if passed_test.passed?
      result_status = 'success'
      message = t('passed_tests_helper.result.success')
    else
      result_status = 'fail'
      message = t('passed_tests_helper.result.fail')
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

  def header_current_question(test_passage)
    content_tag(:p) do
      "#{t('passed_tests_helper.current_question')}: #{test_passage.current_question_number} /
        #{test_passage.total_questions}"
    end
  end

  def header_current_progress(passed_test)
    passed_test.current_question_index / passed_test.total_questions.to_f * 100
  end

  def complete(passed_test)
    if passed_test.passed? && passed_test.success?
      t('passed_tests_helper.result.success')
    else
      t('passed_tests_helper.result.fail')
    end
  end

end
