class ChangeCompanyAdressTypeInEleve < ActiveRecord::Migration[6.0]
  def change
    change_column :eleves, :company_address, :string
  end
end
