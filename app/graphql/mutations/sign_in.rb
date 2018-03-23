# frozen_string_literal: true

module Mutations
  SignIn = GraphQL::Field.define do
    name 'SignIn'
    argument :email, !types.String
    argument :password, !types.String

    type Types::AuthType

    resolve ->(_obj, args, _ctx) {
      @user = User.find_for_database_authentication(email: args[:email])
      if @user
        if @user.valid_password?(args[:password])
          authentication_token = @user.authentication_token
          return OpenStruct.new(authentication_token: authentication_token)
        else
          GraphQL::ExecutionError.new('Incorrect Email/Password')
        end
      else
        GraphQL::ExecutionError.new('User not registered on this application')
      end
    }
  end
end