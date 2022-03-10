class Review < ApplicationRecord
  belongs_to :lesson
  belongs_to :eleve

  validates :eleve, presence: true
  validates :rating, presence: true

  def blank_stars
    5 - rating.to_i
  end
end
