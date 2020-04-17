class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :inscription_confirmation]

  def home
  end
end
