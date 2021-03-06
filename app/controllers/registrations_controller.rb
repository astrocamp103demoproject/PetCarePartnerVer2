class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, :only => :create
  # protect_from_forgery prepend: true
  private
 
  def sign_up_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,
      :current_password)
  end
 
end