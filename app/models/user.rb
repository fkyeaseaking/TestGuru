class User < ApplicationRecord
  has_many :results
  has_many :created_tests, class_name: "Test", optional: true
  has_many :tests, through: :results

  def find_tests_by_level(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id")
        .where(results: { user_id: id })
        .where(level: level)
  end
end
