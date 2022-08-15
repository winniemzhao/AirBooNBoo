class Review < ApplicationRecord
  belongs_to :spooks
  belongs_to :ghosts, through: :spooks

  validates :rating, :comment, presence: true
end
