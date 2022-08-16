class Review < ApplicationRecord
  belongs_to :spook
  belongs_to :ghost, through: :spooks

  validates :rating, :comment, presence: true
end
