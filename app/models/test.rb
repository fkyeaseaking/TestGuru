class Test < ApplicationRecord
  belongs_to :category
  has_many :results

  def self.find_by_category(category)
    Test.joins(:category)
        .where(categories: { title: category })
        .order(title: :desc)
        .pluck(:title)
  end
end
