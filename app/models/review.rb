class Review < ApplicationRecord
  belongs_to :spook

  validates :rating, :comment, presence: true
end
