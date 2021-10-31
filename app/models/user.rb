class User < ApplicationRecord
  def find_tests_by_level(level)
    Test.where(id: [completed_tests], level: level)
  end
end
