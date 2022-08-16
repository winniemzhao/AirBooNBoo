class Spook < ApplicationRecord
  belongs_to :ghost
  belongs_to :user
  has_many :reviews

  validates :start_date, :end_date, presence: true
end
