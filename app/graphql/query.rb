Query = GraphQL::ObjectType.define do
  name 'Query'

  field :protectedQuery, Queries::ProtectedQuery
end
