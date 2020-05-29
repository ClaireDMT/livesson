class TemplatesController < ApplicationController
  def new
    @template = Template.new
    @sports = Sport.all
    @activities = Activity.all
    @eleve = current_user.eleve
  end

  def create
    @template = Template.new(template_params)
    @template.eleve = current_user.eleve
    @sports = Sport.all
    @activities = Activity.all
    if @template.save
      redirect_to :back
    else
      render :new
    end
  end

  private

  def template_params
    params.require(:template).permit(:template_name, :template_description,
                                     :template_material_needed, :template_level,
                                     :eleve_id, :sport_id, :activity_id)
  end
end
