class Eleve < ApplicationRecord
  belongs_to :user
  # has_one_attached :profile_picture
  validates :name

  def prof?
    prof == true
  end

  def moderated?
    moderated == true
  end
end
