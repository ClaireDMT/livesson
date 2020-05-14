# frozen_string_literal: true

class Customdevise::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def edit
    @eleve = current_user.eleve
    if !@eleve.nil?
      redirect_to root_path
    else
      super
    end
  end

  def after_sign_in
    @user = current_user
    @eleve = @user.eleve
    if @user.admin?
      redirect_to admin_root_path
    elsif current_user.prof? && @user.prof? && @eleve.nil?
      redirect_to new_elefe_path
    elsif @eleve.nil?
      redirect_to new_elefe_path
    elsif @eleve.moderated?
      redirect_to edit_elefe_path(@eleve)
    else
      redirect_to root_path
    end
  end

  def after_sign_out
    redirect_to new_user_session_path
  end

  protected

  def after_sign_up_path_for(resource)
    @user.status = "En cours d'inscription"
    @user.save
    edit_user_registration_path
  end

  def after_inactive_sign_up_path_for(resource)
    # super(resource)
    # if @user.newsletter
    #   url = URI('https://api.sendinblue.com/v3/contacts')
    #   http = Net::HTTP.new(url.host, url.port)
    #   http.use_ssl = true
    #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #   request = Net::HTTP::Post.new(url)
    #   request['accept'] = 'application/json'
    #   request['content-type'] = 'application/json'
    #   request['api-key'] = Figaro.env.sendinblue_api_key
    #   request.body = "{\"email\":\"#{@user.email}\",\"listIds\":[8],\"updateEnabled\":true}"
    #   response = http.request(request)
    #   puts response.read_body
    # end
    new_user_confirmation_path
  end
end
