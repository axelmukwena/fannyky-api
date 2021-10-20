class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.id?
      token = issue_token(resource)
      render json: { success: true, user: resource, token: token, message: "Login successful." }
    else
      render json: { success: false, message: "Login failed." }
    end
  end

  def respond_to_on_destroy
    if current_user
      render json: { success: true, message: "Logged out successfully." }
    else
      render json: { success: false, message: "logout failed." }
    end
  end
end