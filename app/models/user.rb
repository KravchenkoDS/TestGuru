class User < ApplicationRecord
  has_many :author, class_name: 'Test', foreign_key: :id
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy

  def test_by_level(level)
    tests.where(level: level)
  end
end
