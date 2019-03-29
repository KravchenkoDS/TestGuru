class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level).joins('INNER JOIN PassedTest ON tests.id = PassedTest.test_id').where(user_tests: {user_id: self.id})
  end
end
