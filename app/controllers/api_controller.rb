class APIController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  include AuthConcern

  protect_from_forgery with: :exception

  before_action :authenticate_user

  rescue_from JWT::DecodeError, with: :invalid_token
  rescue_from InvalidToken, with: :invalid_token

  def invalid_token
    render json: { message: 'Invalid Credentials', code: 401 },
           status: :unauthorized
  end
end
