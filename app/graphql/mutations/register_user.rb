module Mutations
  RegisterUser = GraphQL::Field.define do
    name 'RegisterUser'
    argument :registrationDetails, !Types::Input::UserInputType

    type Types::UserType

    resolve ->(_obj, args, _ctx) {
      input = Hash[args['registrationDetails'].to_h.map {|k, v| [k.to_s.underscore.to_sym, v]}]
      begin
        @user = User.create!(input)
      rescue ActiveRecord::RecordInvalid => invalid
        GraphQL::ExecutionError.new("Invalid Attributes for #{invalid.record.class.name}: #{invalid.record.errors.full_messages.join(', ')}")
      end
    }
  end
end

