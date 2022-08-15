class Spook < ApplicationRecord
  belongs_to :ghosts
  belongs_to :users
end
