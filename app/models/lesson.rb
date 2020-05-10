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

  LANGUES = ["Français", "Anglais", "Espagnol", "Italien", "Portugais", "Allemand"]
  NIVEAUX = ["Tous niveaux", "Débutant", "Intermédiaire", "Avancé"]
  SPORTS = ["Danse", "Yoga", "Barre", "Gym / Pilate",
            "Cardio training", "Renforcement", "Méditation",
            "Stretching", "Sports de combat", "Spécial kids"]

  def duration
    @lesson_duration = end_time - beginning_time
  end

  include PgSearch
  pg_search_scope :search_by_lesson_language,
                  against: [:lesson_language],
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :search_by_lesson_date,
                  against: [:lesson_date],
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :search_by_lesson_level,
                  against: [:lesson_level],
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :search_by_beginning_time,
                  against: [:beginning_time],
                  using: {
                    tsearch: { prefix: true }
                  }
end
