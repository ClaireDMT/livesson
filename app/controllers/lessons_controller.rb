class LessonsController < ApplicationController
  before_action :find_lesson, only: %i[show edit update destroy]

  def index
    @lessons = Lesson.all
  end

  def show
    @prof = Eleve.find(@lesson.eleve.id)
    @eleve = current_user.eleve
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @lesson = Lesson.new
    @sports = Sport.all
    @activities = Activity.all
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.eleve = current_user.eleve
    @sports = Sport.all
    @activities = Activity.all
    @lesson.lesson_duration = @lesson.end_time - @lesson.beginning_time
    if @lesson.save
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
                                   :lesson_discount_price, :sport_id, :activity_id)
  end
end
