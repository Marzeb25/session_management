class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super do |resource|
      # Called after successful sign in
      Rails.logger.info("User #{resource.email} signed in at #{Time.now}")
    end
  end

  # DELETE /resource/sign_out
  def destroy
    user_email = current_user&.email
    super do
      # Called after successful sign out
      Rails.logger.info("User #{user_email} signed out at #{Time.now}")
    end
  end

  protected

  # The path used after a successful authentication. You need to overwrite this method
  # in your controller to define the path after a successful sign in.
  def after_sign_in_path_for(resource)
    root_path
  end

  # The path used after a sign out.
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
