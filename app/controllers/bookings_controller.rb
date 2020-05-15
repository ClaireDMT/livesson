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
    # method in Booking MOdel, works for both prof or eleve cancellation!
    @booking.cancelled_by(current_user.eleve)
    # TO DO : see send_cancellationn methid to add the different emails
    @booking.send_cancellation_email
    redirect_to mes_reservations_eleves(current_user.eleve)
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

  def send_cancellation_email
    if cancelled_by_prof?
      # TO DO: send email with total refund as prof cancellation
    elsif refundable
      # TO DO: send email with total refund as early cancellation by eleve
    else
      # TO DO: send email with NO refund as late cancellation by eleve
    end
  end

  def booking_params
    params.require(:booking).permit(:status, :lesson_id, :eleve_id)
  end
end
