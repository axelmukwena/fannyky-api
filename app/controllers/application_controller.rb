class ApplicationController < ActionController::API

  def issue_token(user)
    JWT.encode({user_id: user.id}, jwt_key, "HS256")
  end

  def token
    request.headers["Authorization"]
  end

  def authorized
    render json: { success: false, message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

  def logged_in?
    !!current_user
  end

  private

  def jwt_key
    Rails.application.credentials.devise[:jwt_secret_key]
  end

  def decoded_token
    begin
      JWT.decode(token, jwt_key, true,
                 { :algorithm => "HS256" })
    rescue JWT::DecodeError
      [{error: "Invalid Token"}]
    end
  end

  def user_id
    decoded_token.first['user_id']
  end

end
