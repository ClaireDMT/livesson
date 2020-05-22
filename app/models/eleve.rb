class Eleve < ApplicationRecord
  belongs_to :user
  belongs_to :sport, optional: true
  has_many :lessons
  has_many :reviews
  has_many :bookings
  has_one_attached :profile_picture
  validates :name, :surname, :birthdate, :sex, :phone_number, :country, presence: true
  with_options if: :prof? do |eleve|
    eleve.validates :city, :presentation, :siret_number, :company_address, :iban, :bic, presence: true
  end

  def prof?
    prof == true
  end

  def moderated?
    moderated == true
  end

  def url_to_fb_pseudo
    pseudo = facebook.match(%r{https?://www.facebook.com/([^/]+)/?})
    pseudo.nil? ? facebook : pseudo[1]
  end

  def url_to_insta_pseudo
    pseudo = instagram.match(%r{https?://www.instagram.com/([^/]+)/?})
    pseudo.nil? ? instagram : pseudo[1]
  end

  def url_to_tw_pseudo
    pseudo = twitter.match(%r{https?://www.twitter.com/([^/]+)/?})
    pseudo.nil? ? twitter : pseudo[1]
  end

  def average_rating
    all_reviews = Review.joins(:lesson).where(lessons: { eleve_id: id })
    all_reviews.map(&:rating).sum.fdiv(all_reviews.count)
  end
end
