class Eleve < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture

  def prof?
    prof == true
  end

  def moderated?
    moderated == true
  end
end
