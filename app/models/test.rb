class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: 'User', optional: true

  def self.by_category(category)
    joins('INNER JOIN categories ON tests.category_id = categories.id', categories: { title: category })
      .order(name: :desc)
        .pluck(:name)
  end
end
