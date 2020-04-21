class Eleve < ApplicationRecord
  belongs_to :user

  def pro?
    eleve.pro == true
  end
end
