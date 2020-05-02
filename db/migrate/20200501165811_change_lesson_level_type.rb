class ChangeLessonLevelType < ActiveRecord::Migration[6.0]
  def change
    change_column :lessons, :lesson_level, :string
  end
end
