Mutation = GraphQL::ObjectType.define do
  name 'Mutation'
  field :signIn, Mutations::SignIn
  field :signUp, Mutations::RegisterUser
end
