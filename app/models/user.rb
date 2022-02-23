class User < ApplicationRecord
    # encrypt password
    has_secure_password
  
    # Model associations
    has_many :todos, foreign_key: :created_by

    # name, email and passsword can't be blank
    validates_presence_of :name, :email, :password_digest
  end
