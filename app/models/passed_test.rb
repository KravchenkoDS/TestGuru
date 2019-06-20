class PassedTest < ApplicationRecord

  scope :passed, -> { where(success: true) }

  SUCCESS_SCORE = 85

  belongs_to :user
  belongs_to :test

  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  def passed?
    success_percentage >= SUCCESS_SCORE
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.success = passed?
    save!
  end

  def success_percentage
    (correct_questions / total_questions.to_f) * 100
  end

  def total_questions
    test.questions.count
  end

  def current_question_number
    current_question_index + 1
  end

  def current_question_index
    test.questions.index(current_question)
  end

  private

  def before_validation_set_question
    if new_record?
      set_first_question
    else
      set_next_question
    end
  end

  def set_first_question
    self.current_question = test.questions.first
  end

  def set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    remaining_questions.first
  end

  def remaining_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

end
