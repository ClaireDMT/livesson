class Lesson < ApplicationRecord
  belongs_to :eleve
  belongs_to :sport
  belongs_to :activity
  belongs_to :template
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # validates :lesson_date, :beginning_time, :end_time,
  #           :lesson_description, :lesson_material_needed,
  #           :lesson_name, :lesson_level, :lesson_duration,
  #           :lesson_language, :lesson_price, presence: true

  def duration
    @lesson_duration = end_time - beginning_time
  end
end
