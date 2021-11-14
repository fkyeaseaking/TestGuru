class User < ApplicationRecord
  def find_tests_by_level(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id")
        .where(results: { user_id: id })
        .where(level: level)
  end
end
