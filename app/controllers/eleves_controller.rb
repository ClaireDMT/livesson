class ElevesController < ApplicationController
  before_action :find_eleve, only: %i[edit update mes_cours mes_reservations eleve_reservations prof_reservations update_password update_email mon_planning]

  def new
    @eleve = Eleve.new


  end

  def create
    @user = current_user
    if Eleve.where(user_id: current_user.id).empty? && @user.prof?
      # si l'élève est un prof également
      new_prof
      UserMailer.inscription_prof(current_user).deliver_now
      render 'awaiting_moderation'
    elsif Eleve.where(user_id: current_user.id).empty?
      # si ce n'est qu'un élève
      new_eleve
      UserMailer.send_welcome(current_user).deliver_now
      redirect_to edit_user_registration_path
    end
  end

  def new_prof
    @eleve = Eleve.new(eleve_params)
    @eleve.user_id = current_user.id
    @eleve.prof = true
    @eleve.status = "En attente de modération"
    @eleve.save
  end

  def new_eleve
    @eleve = Eleve.new(eleve_params)
    @eleve.user_id = current_user.id
    @eleve.status = "Inscrit(e)"
    @eleve.save
  end

  def show
    @prof = Eleve.find(params[:id])
    @eleve = current_user.eleve
    @lesson = Lesson.find(params[:lesson]) if params[:lesson]
    @lessons = Lesson.where(eleve_id: @prof.id)
    @booking = Booking.new
    @reviews = Review.joins(:lesson).where(lessons: { eleve_id: @prof.id })
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @user = @eleve.user
  end

  def update
    if @eleve.update(eleve_params)
      redirect_to edit_elefe_path(@eleve, errors: @errors, alerts: @alerts), notice: 'Profil mis à jour'
    else
      render :edit
    end
  end

  # transformer un élève en prof
  def turn_eleve_into_prof
    @eleve = current_user.eleve
    @eleve = Eleve.find(@eleve.id)
    @eleve.prof = true
    @eleve.save
    UserMailer.inscription_prof(current_user).deliver_now
    render 'awaiting_moderation'
  end

  # liste des templates d'un prof
  def mes_cours
    @templates = Template.where(eleve_id: @eleve)
    new_lesson_and_template
  end

  # mon planning en tant que prof
  def mon_planning
    @lessons = Lesson.where(eleve_id: @eleve.id)
    @templates = Template.where(eleve_id: @eleve)
    new_lesson_and_template
    respond_to do |format|
      format.html
      format.json
    end
  end

  # mes réservations en tant qu'élève et en tant que prof
  def mes_reservations
    eleve_reservations
    prof_reservations
    new_lesson_and_template
    @templates = Template.all.where(eleve_id: @eleve)
  end

  def new_lesson_and_template
    @template = Template.new
    @lesson = Lesson.new
    @sports = Sport.all
    @activities = Activity.all
  end

  def eleve_reservations
    @bookings = Booking.where(eleve_id: @eleve)
    @upcoming_bookings = @bookings.joins(:lesson).where("start > ?", Time.now)
    @upcoming_bookings = @upcoming_bookings.where.not(canceller_id: @eleve, refundable: true)
    @past_bookings = @bookings.joins(:lesson).where("start < ?", Time.now)
    @past_bookings = @past_bookings.where.not(canceller_id: @eleve, refundable: true)
  end

  def prof_reservations
    @lessons = Lesson.where(eleve_id: @eleve)
    @upcoming_lessons = @lessons.where("start > ?", Time.now)
    @cancelled_lessons = @upcoming_lessons.where(status: 'cancelled')
    @upcoming_lessons = @upcoming_lessons.where(status: 'scheduled')
    @past_lessons = @lessons.where("start < ?", Time.now)
  end

def update_password
    @user = @eleve.user
    @user.update_with_password(password_params)
    bypass_sign_in(@user)
    UserMailer.mdp_changed(current_user).deliver_now
    redirect_to edit_elefe_path(@eleve)
  end

  def update_email
    @user = @eleve.user
    @user.update_with_password(email_params)
    UserMailer.email_changed(current_user).deliver_now
    redirect_to edit_elefe_path(@eleve)
  end

  private

  def find_eleve
    @eleve = Eleve.find(params[:id])
  end

  def eleve_params
    params.require(:eleve).permit(:name, :profile_picture, :surname, :birthdate, :sex, :phone_number, :prof, :city, :presentation, :siret_number, :company_address, :facebook, :instagram, :country, :iban, :bic)
  end

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def email_params
    params.require(:user).permit(:email, :current_password)
  end
end
