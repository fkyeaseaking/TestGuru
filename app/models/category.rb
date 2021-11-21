class Category < ApplicationRecord
  has_many :test, dependent: :destroy

  validates :title, presence: true

  default_scope { order(:title) }
end
