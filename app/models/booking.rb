class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :eleve

  def cancelled?
    status == "cancelled"
  end

  def cancelled_by(eleve)
    self.status = "cancelled"
    self.canceller_id = eleve.id
    self.cancellation_time = DateTime.now
    to_refund?
    save
  end

  def refundable_now?
    Time.now < (lesson.start + 0.5)
  end

  def cancelled_by_prof?
    canceller_id != eleve_id
  end

  def to_refund?
    self.refundable = true if cancelled_by_prof?
    #  DateTime : 0.5 = 12h
    self.refundable = true if (cancellation_time > (lesson.start + 0.5)) && !cancelled_by_prof?
    self.refundable = false
    save
  end
end
