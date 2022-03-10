class CreateEleves < ActiveRecord::Migration[6.0]
  def change
    create_table :eleves do |t|

      t.timestamps
    end
  end
end
