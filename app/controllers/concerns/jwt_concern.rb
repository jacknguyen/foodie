module JwtConcern
  def encode(payload)
    payload = payload.dup
    JWT.encode payload, ENV['JWT_SECRET']
  end

  def decode(token)
    decoded_token = JWT.decode(token, ENV['JWT_SECRET'])
    decoded_token&.first
  end

  module_function :encode, :decode
end
