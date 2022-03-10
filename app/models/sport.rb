class Sport < ApplicationRecord
  has_many :lessons
  has_many :eleves
end
