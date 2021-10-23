class AddDefaultToLevelAndCorrect < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tests, :level, "Beginner"
    change_column_default :answers, :correct, false
  end
end
