class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_lesson, only: %i[show edit update destroy]

  def index
    @eleve = current_user.eleve unless current_user.nil?
    @lessons = Lesson.all
    @sports = Sport.all
    query = params[:query]
    if query.present?

      @sport = query[:sport_name]
      if query[:sport_name].present?
        @lessons = @lessons.search_by_sport_name(query[:sport_name])
      end

      @langue = query[:lesson_language]
      if query[:lesson_language].present?
        @lessons = @lessons.search_by_lesson_language(query[:lesson_language])
      end

      if query[:lesson_date].present?
        @lessons = @lessons.search_by_lesson_date(query[:lesson_date])
      end

      # if query[:creneaux].present?
      #   @lessons = @lessons.select do |lesson|
      #     lesson.beginning_time.split(":")[0].to_i >= query[:creneaux].to_i
      #   end
      # end
    end

  end

  def show
    @prof = Eleve.find(@lesson.eleve.id)
    @eleve = current_user.eleve
    @lessons = Lesson.where(eleve_id: @prof.id)
    @booking = Booking.new
    @reviews = Review.joins(:lesson).where(lessons: { eleve_id: @prof.id })
    respond_to do |format|
      format.html { render 'show' }
      format.json { render json: @lessons }
    end
  end

  def new
    @lesson = Lesson.new
    @eleve = current_user.eleve
    @templates = Template.all.where(eleve_id: @eleve)
    @sports = Sport.all
    @activities = Activity.all
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.eleve = current_user.eleve
    @templates = Template.all.where(eleve_id: @lesson.eleve)
    @lesson.lesson_duration = @lesson.end_time - @lesson.beginning_time
    @lesson.sport = @lesson.template.sport
    @lesson.activity = @lesson.template.activity
    if @lesson.save
      @lesson.sport = @lesson.template.sport
      @lesson.activity = @lesson.template.activity
      @lesson.lesson_name = @lesson.template.template_name
      @lesson.lesson_level = @lesson.template.template_level
      @lesson.lesson_description = @lesson.template.template_description
      @lesson.lesson_material_needed = @lesson.template.template_material_needed
      @lesson.save!
      redirect_to lessons_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @lesson.update(lesson_params)
    redirect_to lesson_path(@lesson)
  end

  def destroy
    @lesson.destroy
    redirect_to lesson_path
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:lesson_date, :beginning_time, :end_time,
                                   :lesson_description, :lesson_material_needed,
                                   :lesson_name, :lesson_level, :lesson_duration,
                                   :lesson_language, :lesson_price,
                                   :lesson_discount_price, :sport_id, :activity_id, :template_id)
  end
end
