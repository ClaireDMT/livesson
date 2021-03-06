require_relative 'lesson.rb'
class Lesson < ApplicationRecord
  belongs_to :eleve
  belongs_to :sport
  belongs_to :activity
  belongs_to :template
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # validates :lesson_date, :start, :end,
  #           :lesson_description, :lesson_material_needed,
  #           :lesson_name, :lesson_level, :lesson_duration,
  #           :lesson_language, :lesson_price, presence: true

  LANGUES = ["Français", "Anglais", "Espagnol", "Italien", "Portugais", "Allemand"]
  NIVEAUX = ["Tous niveaux", "Débutant", "Intermédiaire", "Avancé"]
  SPORTS = ["Danse", "Yoga", "Barre", "Gym / Pilate",
            "Cardio training", "Renforcement", "Méditation",
            "Stretching", "Sports de combat", "Spécial kids"]

  def end
    @end = start + (lesson_duration * 60)
  end

  def all_participants
    Eleve.joins(:bookings).where(bookings: { lesson_id: id }).map { |eleve| "#{eleve.name} #{eleve.surname}" }
  end

  def in_15
    (start > DateTime.now) && ((start - DateTime.now) / 60 < 16)
  end

  def in_5
    (start > DateTime.now) && ((start - DateTime.now) / 60 < 6)
  end

  include PgSearch::Model
  pg_search_scope :search_by_sport_name,
                  against: [:sport_id],
                  associated_against: {
                    sport: [:sport_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

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

  pg_search_scope :search_start,
                  against: %i[start],
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :search_end,
                  against: %i[end],
                  using: {
                    tsearch: { prefix: true }
                  }
end
