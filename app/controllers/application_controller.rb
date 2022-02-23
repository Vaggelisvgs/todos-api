class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
  
    # user must be authorize before every action
    before_action :authorize_request
    attr_reader :current_user
  
    private
  
    # Check for valid request token and return user
    def authorize_request
      @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
  end