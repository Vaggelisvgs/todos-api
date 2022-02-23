class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create
    # POST /signup
    # user register
    def create
      user = User.create!(user_params)  # if there is an error, an exception will be raised and handled in the exception handler.
      auth_token = AuthenticateUser.new(user.email, user.password).call #authedicate user
      response = { message: Message.account_created, auth_token: auth_token } # return message and token
      json_response(response, :created)
    end
  
    private
    
    # required values
    def user_params
      params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
  end