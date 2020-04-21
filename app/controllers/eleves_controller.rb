class ElevesController < ApplicationController
  def new
    @eleve = Eleve.new
  end

  def create
    if Eleve.where(user_id: current_user.id).empty?
      p 'Creating an eleve'
      @eleve = Eleve.new(eleve_params)
      @eleve.user_id = current_user.id
      @eleve.save
    else
      p 'Getting last eleve from user'
      @eleve = Eleve.where(user_id: current_user.id).last
    end
    redirect_to edit_user_registration_path
  end

  def edit
    @eleve = Eleve.find(params[:id])
  end

  def update
    @eleve = Eleve.find(params[:id])
    if @eleve.update
      redirect_to edit_elefe_path(@eleve, errors: @errors, alerts: @alerts), notice: 'Profil mis à jour'
    else
      render :edit
    end
  end

  # def registration
  #   # @step = params[:step].nil? ? 1 : params[:step].to_i
  #   # @alerts = params[:alerts].nil? ? [] : params[:alerts]
  #   # @errors = params[:errors].nil? ? [] : params[:errors]
  #   @eleve = Eleve.find(params[:id])
  #   # define_steps(@pro)
  # end

  private

  def eleve_params
    params.require(:eleve).permit(:name, :surname, :birthdate, :sex, :phone_number)
  end
end
