class UserMailer < ApplicationMailer
  default from: "Livesson <hello@livesson.com>"

  # Inscription eleve
  def send_welcome(user)
    mail(to: user.email, subject: 'Bienvenue chez Livesson')
  end

  # Wait for moderation
  def inscription_prof(user)
    mail(to: user.email, subject: "Profil complété en attente de modération")
  end

  # Moderated --> true --> Admin
  def moderated_prof
    mail(to: user.email, subject: "Livesson a accepté votre profil")
  end

  # Moderated --> false --> Admin
  def not_moderated_prof
    mail(to: prof.email, subject: "Livesson a refusé votre profil")
  end

  # Confirmation d'un eleve au cours
  def inscription_cours(booking_id)
    @booking = Booking.find(booking_id)
    @eleve = @booking.eleve_id
    @prof = @booking.lesson.eleve
    @email = Eleve.find(@eleve).user.email
    mail(to: @email, subject: "Votre cours avec #{@prof.name} #{@prof.surname} est confirmée ! ")
  end

  def mdp_changed(user)
    mail(to: user.email, subject: "Votre mot de passe a bien été modifié")
  end

  def email_changed(user)
    mail(to: user.email, subject: "Votre adresse email a bien été modifié")
  end

  def cancel_lessson_by_prof(booking_id)
    @booking = Booking.find(booking_id)
    @eleve = @booking.eleve_id
    @prof = @booking.lesson.eleve
    @email = Eleve.find(@eleve).user.email
    mail(to: user.email, subject: "Votre cours avec #{@prof.name} #{@prof.surname} est annulé")
  end

  def annulation_dans_les_temps(user)
    mail(to: user.email, subject: "Votre cours avec #{@prof.name} #{@prof.surname} est annulé")
  end

  def annulation_pas_dans_les_temps(user)
    mail(to: user.email, subject: "Votre cours avec #{@prof.name} #{@prof.surname} est annulé")
  end

  # def discover_woonies(pro, email)
  #   @pro_url = "https://woonies.com/pros/#{pro.id}"
  #   @pro_name = pro.company_name
  #   mail(to: email, subject: "#{@pro_name} vous invite sur Woonies !")
  # end

  # def reservation_validated(contract_id)
  #   @contract = Contract.find(contract_id)
  #   @pro = @contract.pro
  #   mail(to: @contract.parent.email, subject: "Votre réservation chez #{@pro.company_name} est confirmée !")
  # end

  # def reservation_refused(contract_id)
  #   @contract = Contract.find(contract_id)
  #   @pro = @contract.pro
  #   mail(to: @contract.parent.email, subject: "Votre demande n'a pas pu être satisfaite !")
  # end

  # def reservation_confirmed(contract_id)
  #   @contract = Contract.find(contract_id)
  #   @pro = @contract.pro
  #   mail(to: @contract.parent.email, subject: "Votre demande de réservation est bien envoyée !")
  # end

  # def new_request(pro_id)
  #   @pro = Pro.find(pro_id)
  #   mail(to: @pro.user.email, subject: "Vous avez une nouvelle demande !")
  # end
end
