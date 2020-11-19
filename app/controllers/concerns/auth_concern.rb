# frozen_string_literal: true

module AuthConcern
  extend ActiveSupport::Concern
  class InvalidToken < StandardError; end

  def create_jwt_with(data)
    token = JwtConcern.encode(data)
    cookies.signed[:jwt] = {
      value: token,
      httponly: true
    }
  end

  def current_user
    @current_user ||= User.find decoded_token['user_id']
  end

  private

  def jwt_token
    cookies.signed[:jwt]
  end

  def decoded_token
    JwtConcern&.decode(jwt_token)
  end

  def authenticate_user
    if !valid_token?
      user = User.create
      create_jwt_with({ user_id: user.id })
    end
  end

  def valid_token?
    jwt_token.present? && decoded_token && user_id?
  end

  def user_id?
    decoded_token.key?('user_id')
  end
end
