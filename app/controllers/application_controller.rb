class ApplicationController < ActionController::API

  before_action :active_storage_current_host

  def active_storage_current_host
    ActiveStorage::Current.host = request.base_url
  end

  # ----------- Authorization -----------

  def issue_token(user)
    JWT.encode({user_id: user.id}, jwt_key, "HS256")
  end

  def token
    request.headers["Authorization"]
  end

  # Mostly for internal use
  def authorized
    render json: { success: false, user: nil, message: 'Please log in' } unless logged_in?
  end

  # For front end
  def authorize
    unless authorized
      render json: { success: true, token: token, user: current_user, message: 'Authorized' }
    end
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

  def logged_in?
    !!current_user
  end

  private

  def jwt_key
    if Rails.env == "development"
      Rails.application.credentials.devise[:jwt_secret_key]
    else
      ENV["JWT_SECRET_KEY"]
    end
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
