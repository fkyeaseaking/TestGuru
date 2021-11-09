class User < ApplicationRecord
  def find_tests_by_level(level)
    tests = ActiveRecord::Base.connection.execute <<~SQL
      SELECT tests.*
      FROM tests
      INNER JOIN results ON results.test_id = tests.id
      WHERE results.user_id = #{id} AND tests.level = #{level}
    SQL

    tests.values
  end
end
