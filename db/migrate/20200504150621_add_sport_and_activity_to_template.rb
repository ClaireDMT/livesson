class AddSportAndActivityToTemplate < ActiveRecord::Migration[6.0]
  def change
    add_reference :templates, :sport, index: true, foreign_key: true
    add_reference :templates, :activity, index: true, foreign_key: true
    add_reference :templates, :eleve, index: true, foreign_key: true
    add_reference :lessons, :template, index: true, foreign_key: true
  end
end
