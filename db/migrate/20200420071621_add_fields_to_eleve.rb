class AddFieldsToEleve < ActiveRecord::Migration[6.0]
  def change
    add_column :eleves, :name, :string
    add_column :eleves, :surname, :string
    add_column :eleves, :birthdate, :date
    add_column :eleves, :prof, :boolean
    add_column :eleves, :sex, :string
    add_column :eleves, :phone_number, :string
    add_column :eleves, :country, :string
    add_column :eleves, :city, :string
    add_column :eleves, :presentation, :text
    add_column :eleves, :facebook, :string
    add_column :eleves, :twitter, :string
    add_column :eleves, :instagram, :string
    add_column :eleves, :siret_number, :string
    add_column :eleves, :company_address, :text
    add_column :eleves, :iban, :string
    add_column :eleves, :bic, :string
    add_column :eleves, :admin, :boolean
    add_column :eleves, :status, :string
    add_column :eleves, :moderated, :string
    add_reference :eleves, :user, index: true, foreign_key: true
  end
end
