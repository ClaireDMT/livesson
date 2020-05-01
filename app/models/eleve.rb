class Eleve < ApplicationRecord
  belongs_to :user
  has_many :lessons
  # has_one_attached :profile_picture
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
end
