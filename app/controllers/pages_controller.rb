class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_pro]

  def home
  end

  def home_pro
  end
end
