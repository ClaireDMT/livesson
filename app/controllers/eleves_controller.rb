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
      @eleve.save
    end
    redirect_to edit_user_registration_path
  end

  def new_prof
    @eleve.prof = true
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
    unless @eleve.nil?
      @eleve.prof = true
      @eleve.save
      edit
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
