class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :eleve, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
