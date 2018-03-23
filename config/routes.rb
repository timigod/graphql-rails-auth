Rails.application.routes.draw do
  devise_for :users
  post "/graphql", to: "graphql#execute"
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
end
