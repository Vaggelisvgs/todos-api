class AuthenticateUser
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    # token if user is authedicated
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    attr_reader :email, :password
  
    # check user's email and password
    def user
      user = User.find_by(email: email)
      return user if user && user.authenticate(password)
      # show error message
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end