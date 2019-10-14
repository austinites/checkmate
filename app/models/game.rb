class Game < ApplicationRecord
  belongs_to :user
  scope :available, -> {where(black_id: nil).or(where(white_id: nil))}

end
