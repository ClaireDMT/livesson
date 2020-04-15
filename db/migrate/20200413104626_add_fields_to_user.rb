class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :birthdate, :date
    add_column :users, :prof, :boolean
    add_column :users, :sex, :string
    add_column :users, :phone_number, :string
    add_column :users, :country, :string
    add_column :users, :presentation, :text
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
    add_column :users, :siret_number, :string
    add_column :users, :company_address, :text
    add_column :users, :iban, :string
    add_column :users, :bic, :string
    add_column :users, :admin, :boolean
  end
end
