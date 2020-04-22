Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users
  # root to: 'pages#home'
  # root to: redirect('/users/sign_up')
  # get '/inscription-confirmation', to: 'pages#inscription_confirmation'


  get 'eleves/:id/registration', to: 'eleves#registration', as: :eleve_registration

  devise_for :users, controllers: { registrations: 'customdevise/registrations' }, path: '', path_names: {
    sign_in: 'connexion',
    sign_up: 'inscription',
    sign_out: 'deconnexion'
  }
  devise_scope :user do
    authenticated :user do
        root 'customdevise/registrations#after_sign_in', as: :authenticated_root
    end
    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
    end

  get '/home', to: 'pages#home'
  # root to: redirect('/users/sign_up')
  resources :eleves, only: [:new, :create, :edit, :update]
# post "users/:id/reset", to: "customdevise/registrations#reset_user", as: :user_reset
get "users/:id/mon_compte", to: "customdevise/registrations#account_settings", as: :account_settings
patch "users/:id/update_password", to: "customdevise/registrations#update_password"
patch "users/:id/update_email", to: "customdevise/registrations#update_email"
  end
end
