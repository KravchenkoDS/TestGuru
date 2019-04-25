class User < ApplicationRecord
  # has_many :tests_created, class_name: 'Test', foreign_key: :author_id
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy


  VALID_EMAIL_PATTERN = /\A\w+@\w+\.\w+\z/

  validates :name, presence: true
  validates :email, presence: true,
            format: VALID_EMAIL_PATTERN,
            uniqueness: { case_sensitive: false }

  has_secure_password

  def self.authenticate(email:, password:)
    user = User.find_by(email: email)
    user&.authenticate(password)
  end

  def test_by_level(level)
    tests.where(level: level)
  end

  def passage_test(test)
    passed_tests.order(id: :desc).find_by(test: test)
  end
end
