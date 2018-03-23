# frozen_string_literal: true

module Resolvers
  module Helpers
    class AuthorizeUser
      def initialize(resolve_func)
        @resolve_func = resolve_func
      end

      def call(obj, args, ctx)
        if ctx[:current_user].blank?
          GraphQL::ExecutionError.new('User not signed in')
        else
          @resolve_func.call(obj, args, ctx)
        end
      end
    end
  end
end
