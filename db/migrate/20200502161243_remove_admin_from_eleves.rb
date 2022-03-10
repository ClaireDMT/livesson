class RemoveAdminFromEleves < ActiveRecord::Migration[6.0]
  def change
    remove_column :eleves, :admin
  end
end
