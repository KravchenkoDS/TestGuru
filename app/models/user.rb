class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level).joins('INNER JOIN passed_tests ON tests.id = passed_tests.test_id').where(passed_tests: {user_id: self.id})
  end
end
