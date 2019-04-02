class User < ApplicationRecord
  def tests_by_level(level)
    where(level: level, passed_tests: {user_id: self.id})
        .joins('INNER JOIN passed_tests ON tests.id = passed_tests.test_id')
  end
end
