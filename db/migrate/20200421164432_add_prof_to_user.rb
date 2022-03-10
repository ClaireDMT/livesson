class AddProfToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :prof, :boolean, default: false
  end
end
