class Gist < ApplicationRecord

  belongs_to :question
  belongs_to :user

  validates :url, presence: true

  def gist_hash(url)
    url.split('/')[-1]
  end
end
