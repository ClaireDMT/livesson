# frozen_string_literal: true

class Customdevise::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def edit
    @eleve = current_user.eleve
    if !@eleve.nil?
      redirect_to '/home'
    else
      super
    end
  end

  def after_sign_in
    @user = current_user
    @eleve = @user.eleve
    if @user.admin?
      redirect_to admin_root_path
    elsif @user.prof? && @eleve.nil?
      redirect_to new_elefe_path
    elsif @eleve.nil?
      redirect_to new_elefe_path
    elsif @eleve.moderated?
      redirect_to edit_elefe_path(@eleve)
    else
      redirect_to '/home'
    end
  end

  def after_sign_out
    redirect_to new_user_session_path
  end

  def update_password
    @steps = ['Adresse email', 'Mot de passe']
    @step = params[:step].to_i
    @user = current_user
    @errors = []
    if @user.update_with_password(password_params)
      bypass_sign_in(@user)
      @success = "Votre mot de passe à bien été modifié."
      message = 'Votre mot de passe à bien été modifié'
    else
      message = "Une erreur s'est produite"
      @errors << "Votre mot de passe n'a pas pû être enregistré"
    end
    redirect_to account_settings_path(@user, step: @step, errors: @errors, success: @success), notice: message
  end

  def update_email
    @steps = ['Adresse email', 'Mot de passe']
    @step = params[:step].to_i
    @user = current_user
    @errors = []
    if @user.update_with_password(email_params)
      @success = "Un email de confirmation a été envoyé à #{params[:user][:email]} "
      message = "Un email de confirmation a été envoyé à #{params[:user][:email]}"
    else
      message = "Une erreur s'est produite"
      @errors << "Votre email n'a pas pu être enregistré"
    end
    redirect_to account_settings_path(@user, step: @step, errors: @errors, success: @success), notice: message
  end

  def account_settings
    unless user_signed_in?
      redirect_to root_path
    end
    @user = current_user
    @eleve = @user.eleve
    @success = params[:success].nil? ? '' : params[:success]
    @errors = params[:errors].nil? ? [] : params[:errors]
    # @steps = ['Adresse email', 'Mot de passe']
    # @step = params[:step].nil? ? 1 : params[:step].to_i
  end

  protected

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def email_params
    params.require(:user).permit(:email, :current_password)
  end

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
