class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', optional: true
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: (0..1)) }
  scope :middle, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }

  scope :by_category_scope, ->(category_name) {
    joins(:category)
        .order(name: :desc)
        .where(categories: { title: category_name })
  }

  def self.by_category(category)
    by_category_scope(category)
        .order(name: :desc)
        .pluck(:name)
  end

end
