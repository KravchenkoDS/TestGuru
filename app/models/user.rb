class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy

  validates :email, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end

  scope :test_by_level_scope, ->(level) {
    case level
    when (0..1) then Test.easy
    when (2..4) then Test.middle
    when (5..Float::INFINITY) then Test.hard
    else nil
    end
  }

end
