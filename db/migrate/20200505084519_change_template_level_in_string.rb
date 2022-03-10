class ChangeTemplateLevelInString < ActiveRecord::Migration[6.0]
  def change
    change_column :templates, :template_level, :string
  end
end
