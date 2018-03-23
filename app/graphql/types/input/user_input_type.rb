module Types
  module Input
    UserInputType = GraphQL::InputObjectType.define do
      name 'UserInputType'
      description 'Properties for registering a new User'

      argument :lastName, !types.String
      argument :firstName, !types.String
      argument :email, !types.String
      argument :password, !types.String
    end
  end
end
