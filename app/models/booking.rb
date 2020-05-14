class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :eleve

  def cancelled?
    status == "cancelled"
  end
end
