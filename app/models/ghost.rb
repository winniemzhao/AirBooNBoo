class Ghost < ApplicationRecord
  belongs_to :user
  has_many :spooks, dependent: :destroy
  has_many :reviews, through: :spooks
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :spook_action, :address, :description, :daily_rate, presence: true
end
