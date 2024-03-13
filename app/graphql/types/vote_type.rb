module Types
  class VoteType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :link, Types::LinkType, null: false

    def user
      RecordLoader.for(::User).load(object.user_id)
    end

    def link
      RecordLoader.for(::Link).load(object.link_id)
    end
  end
end
