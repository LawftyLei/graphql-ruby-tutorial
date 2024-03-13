require 'loaders/record_loader'

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :votes, [VoteType], null: true
    field :links, [LinkType], null: true

    # def votes
    #   RecordLoader.for(::Vote).load(object.vote_ids)
    # end
  end
end
