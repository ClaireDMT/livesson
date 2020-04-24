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
  end

  def update
    @eleve = Eleve.find(params[:id])
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

  private

  def eleve_params
    params.require(:eleve).permit(:name, :surname, :birthdate, :sex, :phone_number, :prof, :city, :presentation, :siret_number, :company_address, :facebook, :instagram)
  end
end
