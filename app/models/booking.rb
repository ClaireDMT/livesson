class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :eleve
end
