class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct
      t.belongs_to :question
      t.belongs_to :user

      t.timestamps
    end
  end
end
