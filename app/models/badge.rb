class Badge < ApplicationRecord
  has_many :user_badges, dependent: :nullify
  has_many :users, through: :user_badges, dependent: :nullify

  validates :title, :img_url, :rule_name, :rule_value, presence: true
end
