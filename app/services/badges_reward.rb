class BadgesReward

  attr_accessor :rewarded

  def initialize(passed_test)
    @passed_test = passed_test
    @user = @passed_test.user
  end

  def reward_user!(badge)
    @user.badges << badge
    @rewarded = true
  end

  def call
    Badge.all.each do |badge|
      reward_user!(badge) if self.send("passed_#{badge.rule_name}_rule?", badge.rule_value)
    end
  end

  private

  def passed_first_time_rule?(rule)
    @passed_test.passed? && @user.tests.where("name = ?", @passed_test.test.name).count == 1
  end

  def passed_all_tests_with_level_rule?(level)
    @passed_test.passed? && @user.tests.where("level = ?", level).uniq.count == Test.where("level = ?", level).count
  end

  def passed_all_tests_with_category_rule?(category_id)
    @passed_test.passed? && @user.tests.where("category_id = ?", category_id).uniq.count == Test.where("category_id = ?", category_id).count
  end

end
