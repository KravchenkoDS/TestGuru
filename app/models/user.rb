class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy

  VALID_EMAIL_PATTERN = /\A\w+@\w+\.\w+\z/

  #validates :name, presence: true
  validates :email, presence: true,
            format: VALID_EMAIL_PATTERN,
            uniqueness: { case_sensitive: false }

  def self.authenticate(email:, password:)
    user = User.find_by(email: email)
    user&.authenticate(password)
  end

  def test_by_level(level)
    tests.where(level: level)
  end

  def passage_test(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
