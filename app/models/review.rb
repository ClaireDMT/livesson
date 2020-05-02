class Review < ApplicationRecord
  belongs_to :lesson
  belongs_to :eleve

  validates :content, length: { minimum: 20 }, presence: true
  validates :eleve, presence: true
  validates :rating, presence: true

  def blank_stars
    5 - rating.to_i
  end
end
