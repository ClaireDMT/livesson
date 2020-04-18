class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_pro, :inscription_confirmation]

  def home
  end
end
