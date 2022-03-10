class AddSportAndActivityReferencesToEleve < ActiveRecord::Migration[6.0]
  def change
    add_reference :eleves, :sport, index: true, foreign_key: true
    add_reference :eleves, :activity, index: true, foreign_key: true
  end
end
