class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_pro, :admin]

  def home
    @eleve = current_user.eleve unless current_user.nil?
  end

  def home_pro
  end
end
