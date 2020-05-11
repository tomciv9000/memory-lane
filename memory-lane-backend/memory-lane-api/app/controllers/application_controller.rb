class ApplicationController < ActionController::API
  
  
  
  def encode_token(payload)
    JWT.encode(payload, ENV["API_SECRET_KEY"])
  end

  def auth_header
    request.headers['Authorization']
  end


  def decoded_token(token)
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV["API_SECRET_KEY"], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end
  
  
  ##private
    ##def token(user_id)
    ##  payload = { user_id: user_id }
    ##  JWT.encode(payload, hmac_secret, 'HS256')
    ##end
  ##
 
  ##def hmac_secret
  ##  ENV["API_SECRET_KEY"]
  ##end

  ##
    ##def client_has_valid_token?
    ##  !!current_user_id
    ##end
  ##
    ##def current_user_id
    ##  begin
    ##    token = request.headers["Authorization"]
    ##    decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
    ##    payload = decoded_array.first
    ##  rescue #JWT::VerificationError
    ##    return nil
    ##  end
    ##  payload["user_id"]
    ##end
  ##
    ##def require_login
    ##  render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
    ##end
end