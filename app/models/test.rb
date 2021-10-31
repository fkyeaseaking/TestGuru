class Test < ApplicationRecord
  def self.find_by_category(category)
    category_id = Category.find_by(title: category).id
    where(category_id: category_id).order("id DESC")
  end
end
