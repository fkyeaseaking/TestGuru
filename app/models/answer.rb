class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :max_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def max_answers
    errors.add(:answers, "should be less or equal 4 for test") if question.answers.count >= 4
  end
end
