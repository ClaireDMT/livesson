class ChangeBeginningTimeToBeDatetimeInLessons < ActiveRecord::Migration[6.0]
  def change
    remove_column :lessons, :beginning_time
    add_column :lessons, :start, :datetime
    remove_column :lessons, :end_time
    add_column :lessons, :end, :datetime
  end
end
