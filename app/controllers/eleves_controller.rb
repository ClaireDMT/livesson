class ElevesController < ApplicationController
  def new
    @eleve = Eleve.new
  end

  def create
    @user = current_user
    if Eleve.where(user_id: current_user.id).empty? && @user.prof?
      @eleve = Eleve.new(eleve_params)
      @eleve.user_id = current_user.id
      new_prof
      UserMailer.inscription_prof(current_user).deliver_now
    elsif Eleve.where(user_id: current_user.id).empty?
      @eleve = Eleve.new(eleve_params)
      @eleve.user_id = current_user.id
      @eleve.status = "Inscrit(e)"
      @eleve.save
      UserMailer.send_welcome(current_user).deliver_now
    end
    redirect_to edit_user_registration_path
  end

  def new_prof
    @eleve.prof = true
    @eleve.status = "En attente de modération"
    @eleve.save
  end

  def edit
    @eleve = Eleve.find(params[:id])
    @user = @eleve.user
  end

  def update
    @eleve = Eleve.find(params[:id])
    @user = User.find(params[:id])
    if @eleve.update(eleve_params)
      redirect_to edit_elefe_path(@eleve, errors: @errors, alerts: @alerts), notice: 'Profil mis à jour'
    else
      render :edit
    end
  end

  def turn_eleve_into_prof
    @eleve = current_user.eleve
    @eleve = Eleve.find(@eleve.id)
    @eleve.prof = true
    @eleve.save
  end

  def mes_cours
    @eleve = Eleve.find(params[:id])
    @templates = Template.where(eleve_id: @eleve)
  end

  def mes_reservations
    @eleve = Eleve.find(params[:id])
    @bookings = Booking.where(eleve_id: @eleve)
    @upcoming_bookings = upcoming_events
    @past_bookings = past_events
    @lessons = Lesson.where(eleve_id: @eleve)
    @upcoming_lessons = @lessons.where("lesson_date > ?", Date.today)
    @past_lessons = @lessons.where("lesson_date < ?", Date.today)
  end

  def upcoming_events
    @bookings = Booking.where(eleve_id: @eleve)
    @bookings.each_with_object([]) do |booking, upcoming_bookings|
      upcoming_bookings << booking if booking.lesson.lesson_date > Date.today
    end
  end

  def past_events
    @bookings = Booking.where(eleve_id: @eleve)
    @bookings.each_with_object([]) do |booking, past_bookings|
      past_bookings << booking if booking.lesson.lesson_date < Date.today
    end
  end

  private

  def eleve_params
    params.require(:eleve).permit(:name, :profile_picture, :surname, :birthdate, :sex, :phone_number, :prof, :city, :presentation, :siret_number, :company_address, :facebook, :instagram, :country, :iban, :bic)
  end
end
