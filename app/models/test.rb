class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 4..Float::INFINITY) }
  scope :find_by_category, lambda { |category|
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }
  scope :find_by_level, ->(level) { where(level: level) }

  def self.find_titles_by_category(category)
    find_by_category(category).pluck(:title)
  end
end
