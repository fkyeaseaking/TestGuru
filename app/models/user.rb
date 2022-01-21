class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :email, presence: true

  def find_tests_by_level(level)
    tests.find_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
