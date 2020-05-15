class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @review = Review.new(review_params)
    @review.lesson = @lesson
    @review.eleve = current_user.eleve
    @review.save!
    respond_to do |format|
      format.html { redirect_to mes_reservations_eleves_path(current_user.eleve) }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
