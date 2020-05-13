class ElevesController < ApplicationController
  before_action :find_eleve, only: %i[edit update mes_cours mes_reservations eleve_reservations prof_reservations update_password update_email]

  def new
    @eleve = Eleve.new
  end

  def create
    @user = current_user
    if Eleve.where(user_id: current_user.id).empty? && @user.prof?
      # si l'élève est un prof également
      @eleve = Eleve.new(eleve_params)
      @eleve.user_id = current_user.id
      new_prof
      UserMailer.inscription_prof(current_user).deliver_now
      awaiting_moderation
      render 'awaiting_moderation'
    elsif Eleve.where(user_id: current_user.id).empty?
      # si ce n'est qu'un élève
      @eleve = Eleve.new(eleve_params)
      @eleve.user_id = current_user.id
      @eleve.status = "Inscrit(e)"
      @eleve.save
      UserMailer.send_welcome(current_user).deliver_now
      redirect_to edit_user_registration_path
    end
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

  def new_prof
    @eleve.prof = true
    @eleve.status = "En attente de modération"
    @eleve.save
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
    @template = Template.new
    @lesson = Lesson.new
    @sports = Sport.all
    @activities = Activity.all
  end

  # mes réservations en tant qu'élève et en tant que prof
  def mes_reservations
    eleve_reservations
    prof_reservations
    @template = Template.new
    @lesson = Lesson.new
    @templates = Template.all.where(eleve_id: @eleve)
    @sports = Sport.all
    @activities = Activity.all
  end

  def eleve_reservations
    @bookings = Booking.where(eleve_id: @eleve)
    @upcoming_bookings = @bookings.joins(:lesson).where("start > ?", Time.now)
    @past_bookings = @bookings.joins(:lesson).where("start < ?", Time.now)
  end

  def prof_reservations
    @lessons = Lesson.where(eleve_id: @eleve)
    @upcoming_lessons = @lessons.where("start > ?", Time.now)
    @past_lessons = @lessons.where("start < ?", Time.now)
  end

def update_password
    @user = @eleve.user
    @errors = []
    if @user.update_with_password(password_params)
      bypass_sign_in(@user)
      @success = "Votre mot de passe à bien été modifié."
      message = 'Votre mot de passe à bien été modifié'
    else
      message = "Une erreur s'est produite"
      @errors << "Votre mot de passe n'a pas pû être enregistré"
    end
  end

  def update_email
    @user = @eleve.user
    @errors = []
    if @user.update_with_password(email_params)
      @success = "Un email de confirmation a été envoyé à #{params[:user][:email]} "
      message = "Un email de confirmation a été envoyé à #{params[:user][:email]}"
    else
      message = "Une erreur s'est produite"
      @errors << "Votre email n'a pas pu être enregistré"
    end
  end

  # def account_settings
  #   unless user_signed_in?
  #     redirect_to root_path
  #   end
  #   @user = current_user
  #   @eleve = @user.eleve
  #   @success = params[:success].nil? ? '' : params[:success]
  #   @errors = params[:errors].nil? ? [] : params[:errors]
  #   # @steps = ['Adresse email', 'Mot de passe']
  #   # @step = params[:step].nil? ? 1 : params[:step].to_i
  # end

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
