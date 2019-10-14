class Game < ApplicationRecord
  belongs_to :user
  scope :available, -> (where("white_id > 0 || black_id > 0"))
end
