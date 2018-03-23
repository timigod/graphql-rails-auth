# frozen_string_literal: true

module Queries
  ProtectedQuery = GraphQL::Field.define do
    name 'ProtectedQuery'
    type Types::UserType

    resolve Resolvers::Helpers::AuthorizeUser.new(->(_obj, _args, ctx) {
      ctx[:current_user]
    })
  end
end
