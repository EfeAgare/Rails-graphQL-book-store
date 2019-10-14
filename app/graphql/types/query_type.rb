module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    ## query
    field :authors, [Types::AuthorType], null: false do
      description "fetch all authors"
    end
      
    field :author, Types::AuthorType, null: false do
      description "fetch an author with the id"

      argument :id, ID, required: true
    end





    ## resolvers
    def authors
     Author.all
    end

    def author(id:)
      Author.find_by(id: id)
    end
  end
end
