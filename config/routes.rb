Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # homepage
  root to: 'pages#home'
  # homepage prof
  get '/prof', to: 'pages#home_pro'
  # curstom registration controller devise
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
  end
  # eleve routes
  resources :eleves, only: [:new, :create, :edit, :update, :show] do
    collection do
      get '/turn_eleve_into_prof', to: 'eleves#turn_eleve_into_prof'
      get '/:id/mes-cours', to: 'eleves#mes_cours', as: :mes_cours
      get '/:id/mes-reservations', to: 'eleves#mes_reservations', as: :mes_reservations
    end
  end

  # route pour annuler une réservation
  resources :bookings, only: :destroy
  # routes pour la création d'un template
  resources :templates, only: [:index, :new, :create]
  # routes pour lessons avec l'annotation et la réservation imbriquées
  resources :lessons do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end
  # routes pour modifier email et mdp d'un user
  get "eleves/:id/mon_compte", to: "customdevise/registrations#account_settings", as: :account_settings
  patch "eleves/:id/update_password", to: "eleves#update_password"
  patch "eleves/:id/update_email", to: "eleves#update_email"
end
