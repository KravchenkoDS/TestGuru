class Answer < ApplicationRecord

  MAX_ANSWERS_NUMBER = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  scope :correct, -> {where(correct: true)}

  private

  def validate_max_answers
    errors.add(:base, 'Must have 1 to 4 answers') if question.answers.count >= MAX_ANSWERS_NUMBER
  end
end
