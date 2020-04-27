class AddSportAndActivityReferencesToLesson < ActiveRecord::Migration[6.0]
  def change
    add_reference :lessons, :sport, index: true, foreign_key: true
    add_reference :lessons, :activity, index: true, foreign_key: true
  end
end
