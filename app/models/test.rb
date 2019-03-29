class Test < ApplicationRecord
  def self.tests_by_category(category)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where(categories: {body: category}).order('tests.name DESC').pluck('tests.name')
  end
end
