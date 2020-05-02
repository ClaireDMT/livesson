ActiveAdmin.register Eleve do

  filter :name_contains
  filter :surname_contains
  filter :user_email_contains, :as => :string
  filter :prof

  index do
    selectable_column
    column :name
    column :surname
    column :user
    column :prof
    actions
  end

  form do |f|
    f.inputs "Identity" do
      f.input :name
      f.input :surname
      f.input :birthdate
      f.input :sex
      f.input :phone_number
      f.input :country
      f.input :city
    end
    f.inputs "Prof" do
      f.input :prof
      f.input :moderated
      f.input :presentation
      f.input :facebook
      f.input :twitter
      f.input :instagram
      f.input :siret_number
      f.input :company_address
      f.input :iban
      f.input :bic
      f.input :status
      f.input :moderated
    end
    f.actions
  end

  permit_params :name, :surname, :birthdate, :sex,
                :phone_number, :country, :city, :prof,
                :moderated, :presentation, :facebook,
                :twitter, :instagram, :siret_number,
                :company_address, :iban, :bic, :status,
                :moderated
end