class User < ApplicationRecord
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy

=begin
  def tests_by_level(level)
    where(level: level, passed_tests: {user_id: self.id})
        .joins('INNER JOIN passed_tests ON tests.id = passed_tests.test_id')
  end
=end
  def test_by_level(level)
    tests.where(level: level)
  end
end
