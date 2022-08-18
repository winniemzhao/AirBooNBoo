class Ghost < ApplicationRecord
  belongs_to :user
  has_many :spooks, dependent: :destroy
  has_many :reviews, through: :spooks
  has_one_attached :photo

  validates :name, :spook_action, :location, :description, :daily_rate, presence: true
end
