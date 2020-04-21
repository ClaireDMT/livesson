class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one :eleve, dependent: :destroy

  def admin?
    false
    # admin == true
  end

  def prof?
    user.prof == true
  end
end
