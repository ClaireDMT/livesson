class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_pro, :admin]

  def home
    @eleve = current_user.eleve
  end

  def home_pro
  end
end
