class CreateTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :templates do |t|
      t.text :template_description
      t.text :template_material_needed
      t.string :template_name
      t.integer :template_level

      t.timestamps
    end
  end
end
