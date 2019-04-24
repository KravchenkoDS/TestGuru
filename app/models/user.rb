class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy

  validates :email, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end

  def passage_test(test)
    #passed_tests.order(id: :desc).find_by(test_id: test.id)
    passed_tests.order(id: :desc).find_by(test: test)
  end
end
