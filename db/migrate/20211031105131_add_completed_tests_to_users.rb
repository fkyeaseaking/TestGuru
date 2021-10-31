class AddCompletedTestsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :completed_tests, :jsonb
  end
end
