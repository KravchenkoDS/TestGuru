class Category < ApplicationRecord
  default_scope { order :title }

  has_many :tests, dependent: :nullify

  validates :title, presence: true

  default_scope { order(title: :asc) }
end
