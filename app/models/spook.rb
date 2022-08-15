class Spook < ApplicationRecord
  belongs_to :ghosts
  belongs_to :users
  has_many :reviews

  validates :start_date, :end_date, presence: true
end
