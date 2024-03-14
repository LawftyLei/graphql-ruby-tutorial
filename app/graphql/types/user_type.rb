require 'loaders/record_loader'
require 'loaders/user_loader'

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :votes, [VoteType], null: true
    field :links, [LinkType], null: true

    def votes
      UserLoader.for(Vote).load(object.id)
    end
  end
end
