GraphqlAuthSchema = GraphQL::Schema.define do
  mutation(Mutation)
  query(Query)
end
