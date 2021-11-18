class User < ApplicationRecord
  has_many :results
  has_many :created_tests, class_name: "Test", dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy

  def find_tests_by_level(level)
    tests.where(level: level)
  end
end
