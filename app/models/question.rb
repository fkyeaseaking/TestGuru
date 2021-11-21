class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true

  validate :max_answers

  private

  def max_answers
    errors.add(:answers, "should be less or equal 4 answers for test") if answers.count > 4
  end
end
