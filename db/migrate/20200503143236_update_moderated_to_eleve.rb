class UpdateModeratedToEleve < ActiveRecord::Migration[6.0]
  def change
    change_column :eleves, :moderated, :boolean, using: 'moderated::boolean', default: false
  end
end
