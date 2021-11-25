class User < ApplicationRecord
  has_many :results
  has_many :created_tests, class_name: "Test", dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy

  validates :email, presence: true

  def find_tests_by_level(level)
    tests.find_by_level(level)
  end
end
