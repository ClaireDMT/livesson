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
    elsif Eleve.where(user_id: current_user.id).empty?
      @eleve = Eleve.new(eleve_params)
      @eleve.user_id = current_user.id
      @eleve.status = "Inscrit(e)"
      @eleve.save
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
    @user = User.find(params[:user_id])
    if @eleve.update(eleve_params)
      redirect_to edit_elefe_path(@eleve, errors: @errors, alerts: @alerts), notice: 'Profil mis à jour'
    else
      render :edit
    end
  end

  def turn_eleve_into_prof
    @eleve = current_user.eleve
    @eleve = Eleve.find(@eleve.id)
    unless @eleve.nil?
      new_prof
    end
  end

  def update_password
    @steps = ['Adresse email', 'Mot de passe']
    @step = params[:step].to_i
    @user = current_user
    @errors = []
    if @user.update_with_password(password_params)
      bypass_sign_in(@user)
      @success = "Votre mot de passe à bien été modifié."
      message = 'Votre mot de passe à bien été modifié'
    else
      message = "Une erreur s'est produite"
      @errors << "Votre mot de passe n'a pas pû être enregistré"
    end
    redirect_to account_settings_path(@user, step: @step, errors: @errors, success: @success), notice: message
  end

  def update_email
    @steps = ['Adresse email', 'Mot de passe']
    @step = params[:step].to_i
    @user = current_user
    @errors = []
    if @user.update_with_password(email_params)
      @success = "Un email de confirmation a été envoyé à #{params[:user][:email]} "
      message = "Un email de confirmation a été envoyé à #{params[:user][:email]}"
    else
      message = "Une erreur s'est produite"
      @errors << "Votre email n'a pas pu être enregistré"
    end
    redirect_to account_settings_path(@user, step: @step, errors: @errors, success: @success), notice: message
  end

  def account_settings
    unless user_signed_in?
      redirect_to root_path
    end
    @user = current_user
    @eleve = @user.eleve
    @success = params[:success].nil? ? '' : params[:success]
    @errors = params[:errors].nil? ? [] : params[:errors]
    # @steps = ['Adresse email', 'Mot de passe']
    # @step = params[:step].nil? ? 1 : params[:step].to_i
  end

  private

  def eleve_params
    params.require(:eleve).permit(:name, :surname, :birthdate, :sex, :phone_number, :prof, :city, :presentation, :siret_number, :company_address, :facebook, :instagram, :country, :iban, :bic)
  end
end
