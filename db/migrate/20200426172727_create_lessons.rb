class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.date :lesson_date
      t.time :beginning_time
      t.time :end_time
      t.text :lesson_description
      t.text :lesson_material_needed
      t.integer :review
      t.string :lesson_name
      t.integer :lesson_level
      t.integer :lesson_duration
      t.string :lesson_language
      t.integer :lesson_price
      t.integer :lesson_discount_price

      t.timestamps
    end
  end
end
