class Ghost < ApplicationRecord
  belongs_to :users
  has_many :reviews, through: :spooks

  validates :name, :spook_action, :location, :description, :daily_rate, presence: true

end
