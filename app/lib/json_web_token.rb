class JsonWebToken
    #encode and decode token
    HMAC_SECRET = Rails.application.secrets.secret_key_base
  
    def self.encode(payload, exp = 24.hours.from_now)
      # token expires in one day from creation
      payload[:exp] = exp.to_i
      # sign token with application secret
      JWT.encode(payload, HMAC_SECRET)
    end
  
    def self.decode(token)
      # get payload; first index in decoded Array
      body = JWT.decode(token, HMAC_SECRET)[0]
      HashWithIndifferentAccess.new body
      # rescue from all decode errors
    rescue JWT::DecodeError => e
      # raise custom error to be handled by custom handler
      raise ExceptionHandler::InvalidToken, e.message
    end
 

 
end