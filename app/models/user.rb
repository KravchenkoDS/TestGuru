class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def test_by_level(level)
    tests.where(level: level)
  end

  def passage_test(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def admin?
    is_a?(Admin)
  end
end
