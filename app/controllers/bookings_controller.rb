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
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save
    redirect_to lessons_path
  end

  def destroy
    # @training = Training.find(params[:training_id])
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to lessons_path
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :lesson_id, :eleve_id)
  end
end
