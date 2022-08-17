class Spook < ApplicationRecord
  belongs_to :ghost
  belongs_to :user
  has_many :reviews

  validates :start_date, :end_date, presence: true

  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }
end
