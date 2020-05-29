class TemplatesController < ApplicationController
  def index
    @templates = Template.where(eleve_id: current_user.eleve)
    @eleve = current_user.eleve
    @template = Template.new
    @lesson = Lesson.new
    @sports = Sport.all
    @activities = Activity.all
  end

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
      redirect_to request.referrer
    else
      render :new
    end
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    redirect_to request.referrer
  end

  private

  def template_params
    params.require(:template).permit(:template_name, :template_description,
                                     :template_material_needed, :template_level,
                                     :eleve_id, :sport_id, :activity_id)
  end
end
