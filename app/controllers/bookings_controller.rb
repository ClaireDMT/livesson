class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @eleve = current_user.eleve.id
    @booking = Booking.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @eleve = current_user.eleve.id
    @booking = Booking.new(lesson: @lesson, eleve_id: @eleve)
    if @booking.save
      UserMailer.inscription_cours(@booking.id).deliver_now
      redirect_to mes_reservations_eleves_url(@eleve)
    else
      render :new
    end
  end

  def cancel
    @booking = Booking.find(params[:id])
    # method in Booking Model, works for both prof or eleve cancellation!
    @booking.cancelled_by(current_user.eleve)
    send_cancellation_email(@booking)
    redirect_to mes_reservations_eleves_url(current_user.eleve)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save
    redirect_to lessons_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to mes_reservations_eleves_url(@booking.eleve_id)
  end


  private

  def send_cancellation_email(booking)
    if @booking.cancelled_by_prof?
      UserMailer.cancel_lessson_by_prof(@booking.id).deliver_now
    elsif @booking.refundable
      UserMailer.refund(@booking.id).deliver_now
    else
      UserMailer.no_refund(@booking.id).deliver_now
    end
  end

  def booking_params
    params.require(:booking).permit(:status, :lesson_id, :eleve_id)
  end
end
