class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :eleve

  def cancelled?
    status == "cancelled"
  end

  def cancelled_by(eleve)
    self.status = "cancelled"
    self.canceller_id = eleve
    self.cancellation_time = DateTime.now

    raise
    # Refundable cases
    #  True if @booking.canceller != @booking.eleve => good email
    #  true if @cancellation_time > @booking.lesson +12h => good email
    # else false => good email

    save!
  end
end
