class User < ApplicationRecord
  #has_and_belongs_to_many :tests
  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def tests_by_level(level)
    where(level: level, passed_tests: {user_id: self.id})
        .joins('INNER JOIN passed_tests ON tests.id = passed_tests.test_id')
  end
end
