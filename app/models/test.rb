class Test < ApplicationRecord
  belongs_to :question
  has_many :questions
end
