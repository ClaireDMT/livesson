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
      get '/:id/mon-planning', to: 'eleves#mon_planning', as: :mon_planning
      patch "/:id/update_password", to: "eleves#update_password"
      patch "/:id/update_email", to: "eleves#update_email"
    end
  end
  # route pour supprimer un booking
  resources :bookings, only: :destroy do
    collection do
      get '/:id/annuler', to: 'bookings#cancel', as: :cancel
    end
  end
  # routes pour la création d'un template
  resources :templates, only: [:index, :new, :create]
  # routes pour lessons avec l'annotation et la réservation imbriquées
  resources :lessons do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
    collection do
      # route render la mini-show d'une lesson sur un prof pour la réserver
      get 'reservation_lesson/:id',to: 'lessons#resa_show', as: :resa_show
      # route pour annuler une lesson en tant que prof
      get '/:id/annulation_professeur', to: 'lessons#prof_cancellation', as: :prof_cancellation
    end
  end
end
