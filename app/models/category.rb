class Category < ApplicationRecord
  default_scope { order(:title) }

  has_many :test, dependent: :destroy

  validates :title, presence: true
end
