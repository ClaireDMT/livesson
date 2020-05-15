class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :find_lesson, only: %i[show edit update destroy lesson_video prof_cancellation]
  before_action :find_query, only: %i[search_sport_name search_lesson_language search_lesson_level search_lesson_date search_beginning_time search_sport_name_and_lesson_language search_all]

  def index
    @eleve = current_user.eleve unless current_user.nil?
    @lessons = Lesson.all
    query = params[:query]
    if query.present?
      search_sport_name
      search_lesson_language
      search_lesson_level
      search_lesson_date
      search_start
      search_sport_name_and_lesson_language
      search_sport_name_lesson_language_and_lesson_level
      search_all
    end
  end

  def search_sport_name
    @sports = query[:sport_name]
    @lessons = @lessons.joins(:sport).where("sport_name IN (?)", @sports) if query[:sport_name].present?
  end

  def search_lesson_language
    @langues = query[:lesson_language]
    @lessons = @lessons.search_by_lesson_language(query[:lesson_language]) if query[:lesson_language].present?
  end

  def search_lesson_level
    @niveaux = query[:lesson_level]
    @lessons = @lessons.search_by_lesson_level(query[:lesson_level]) if query[:lesson_level].present?
  end

  def search_lesson_date
    @lessons = @lessons.search_by_lesson_date(query[:lesson_date]) if query[:lesson_date].present?
  end

  def search_start
    query = params[:query]
    @lessons = @lessons.search_by_start(query[:start]) if query[:start].present?
  end

  def search_sport_name_and_lesson_language
    if query[:sport_name].present? && query[:lesson_language].present?
      @lessons = @lessons.joins(:sport).where("sport_name IN (?)AND lesson_language IN (?)",
                                              @sports, @langues)
    end
  end

  def search_sport_name_lesson_language_and_lesson_level
    if query[:sport_name].present? && query[:lesson_language].present? && query[:lesson_level].present?
      @lessons = @lessons.joins(:sport).where("sport_name IN (?) AND lesson_language IN (?) AND lesson_level IN (?)",
                                              @sports, @langues, @niveaux)
    end
  end

  def search_all
    if query[:sport_name].present? && query[:lesson_language].present? &&
       query[:lesson_level].present? && query[:lesson_date].present?
      @lessons = @lessons.joins(:sport).where("sport_name IN (?)
                                               AND lesson_language IN (?)
                                               AND lesson_level IN (?) AND lesson_date = ?",
                                              @sports, @langues, @niveaux, query[:lesson_date])
    end
  end

  def new
    @lesson = Lesson.new
    @eleve = current_user.eleve
    @templates = Template.all.where(eleve_id: @eleve)
    @sports = Sport.all
    @activities = Activity.all
  end

  def show
    @lesson.streaming_url = "https://meet.jit.si/lessons/#{@lesson.id}" if @lesson.streaming_url.nil?
    @lesson.save
    @eleve = current_user.eleve unless current_user.nil?
    respond_to do |format|
      format.html
      format.json { render json: { lesson: @lesson } }
    end
  end

  def resa_show
    @eleve = current_user.eleve
    @lesson = Lesson.find(params[:id])
    @booking = Booking.new
    @prof = Eleve.find(@lesson.eleve_id)
    render layout: false
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.eleve = current_user.eleve
    @templates = Template.all.where(eleve_id: @lesson.eleve)
    @lesson.end = @lesson.start + (@lesson.lesson_duration * 60)
    @lesson.sport = @lesson.template.sport
    @lesson.activity = @lesson.template.activity
    if @lesson.save
      template_in_lesson
      redirect_to lessons_path
    else
      render :new
    end
  end

  def template_in_lesson
    @lesson.sport = @lesson.template.sport
    @lesson.activity = @lesson.template.activity
    @lesson.lesson_name = @lesson.template.template_name
    @lesson.lesson_level = @lesson.template.template_level
    @lesson.lesson_description = @lesson.template.template_description
    @lesson.lesson_material_needed = @lesson.template.template_material_needed
    @lesson.save
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

  def prof_cancellation
    @lesson.status = "cancelled"
    @prof = @lesson.eleve
    bookings = Booking.where(lesson_id: @lesson.id)
    bookings.each do |booking|
      booking.cancelled_by(@prof)
    end
    redirect_to mes_reservations_eleves_path(@prof)
  end

  def lesson_video
    @lesson.lesson_date == Date.today && @lesson.start == Time.now - 15.min
    @prof = @lesson.eleve
    @bookings = Booking.where(lesson: @lesson)
    @eleves = Eleve.where(id: @bookings.eleve_id)
  end

  private

  def find_query
    query = params[:query]
  end

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:lesson_date, :start, :end,
                                   :lesson_description, :lesson_material_needed,
                                   :lesson_name, :lesson_level, :lesson_duration,
                                   :lesson_language, :lesson_price,
                                   :lesson_discount_price, :sport_id, :activity_id, :template_id)
  end
end
