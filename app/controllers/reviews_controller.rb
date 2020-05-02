class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @review = Review.new(review_params)
    @review.lesson = @lesson
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to tour_path(@lesson) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'lessons/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
