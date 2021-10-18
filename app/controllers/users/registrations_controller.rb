class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { success: true, message: "Signed up successfully." }
    else
      render json: { success: false, message: "Signup failed." }
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end