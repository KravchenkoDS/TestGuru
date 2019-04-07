class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', optional: true
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests, dependent: :destroy

=begin
  def self.by_category(category)
    joins('INNER JOIN categories ON tests.category = categories', categories: { title: category })
      .order(name: :desc)
        .pluck(:name)
  end
=end
  def self.by_category(category)
    joins(:category)
        .where(categories: { title: category })
        .order(name: :desc)
        .pluck(:name)
  end
end
