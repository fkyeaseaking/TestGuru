class User < ApplicationRecord
  has_many :results

  def find_tests_by_level(level)
    Test.joins(:results)
        .where(results: { user_id: id })
        .where(level: level)
  end
end
