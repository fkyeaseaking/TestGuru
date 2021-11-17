class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.find_by_category(category)
    Test.joins(:category)
        .where(categories: { title: category })
        .order(title: :desc)
        .pluck(:title)
  end
end
