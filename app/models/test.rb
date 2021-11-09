class Test < ApplicationRecord
  def self.find_by_category(category)
    titles = ActiveRecord::Base.connection.execute <<~SQL
      SELECT tests.title 
      FROM tests
      INNER JOIN categories ON categories.id = tests.category_id
      WHERE categories.title = '#{category}'
      ORDER BY tests.title DESC
    SQL

    titles.values
  end
end
