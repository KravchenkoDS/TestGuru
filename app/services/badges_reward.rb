class BadgesReward

  def initialize(passed_test)
    @passed_test = passed_test
    @user = @passed_test.user
  end

  def call
    Badge.all.select { |badge| send("passed_#{badge.rule_name}_rule?", badge.rule_value) }
  end

  private

  def passed_first_time_rule?(rule)
    @passed_test.passed? && @user.tests.where("name = ?", @passed_test.test.name).count == 1
  end

  def passed_all_tests_with_level_rule?(level)
    return if level.to_i != @passed_test.test.level

    @passed_test.passed? && @user.tests.where("level = ?", level).uniq.count == Test.where("level = ?", level).count
  end

  def passed_all_tests_with_category_rule?(category_id)
    return if category_id.to_i != @passed_test.test.category_id

    category_tests = Test.where(category: category_id).pluck(:id)
    completed_tests = @user.passed_tests.passed.where(test: category_tests).pluck(:test_id).uniq

    category_tests.count == completed_tests.count
  end

end
