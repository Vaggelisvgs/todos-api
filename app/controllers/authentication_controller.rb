class AuthenticationController < ApplicationController
    # skip login after register
    skip_before_action :authorize_request, only: :authenticate

    # login user
    def authenticate
      auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call # authedicate user
      json_response(auth_token: auth_token) # return auth token
    end
  
    private
    
    #required values
    def auth_params
      params.permit(:email, :password)
    end
  end
  
