class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save
  end

  def completed?
    current_question.nil?
  end

  def passed?
    result >= SUCCESS_RATIO
  end

  def result
    (self.correct_questions.to_f / self.test.questions.count) * 100
  end

  def progress
    test.questions.count - test.questions.order(:id).where("id > ?", current_question.id).count
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question #test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    return test.questions.first if test.present? && self.current_question.nil?

    test.questions.order(:id).where("id > ?", current_question.id).first
  end
end
