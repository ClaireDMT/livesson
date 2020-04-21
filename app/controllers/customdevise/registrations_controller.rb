# frozen_string_literal: true

class Customdevise::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @eleve = current_user.eleve
    if !@eleve.nil?
      # if @eleve.status == 'En attente de modération'
      #   render 'awaiting_moderation'
      #   return
      # else
      redirect_to '/home'
      # end
    else
      super
    end
  end

  # PUT /resource
  # def update
  #   super
  # end

  def after_sign_in
    @user = current_user
    # @eleve = @user.eleve
    # raise
    if @user.admin?
      redirect_to admin_root_path
    elsif @eleve.nil?
      redirect_to new_elefe_path
    # elsif @eleve.moderated?
    #   redirect_to planning_pro_path(current_user.eleve)
    else
      redirect_to '/home'
    end
  end

  def after_sign_out
    redirect_to new_user_session_path
  end

  # def reset_user
  #   all_pros = Pro.where(user_id: current_user.id)
  #   all_pros.destroy_all unless all_pros.nil?
  #   redirect_to new_pro_path
  # end

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
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
