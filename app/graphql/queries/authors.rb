module Queries
  class Authors < Queries::BaseQuery
    description "returns all author"

    type [Types::AuthorType], null: false

    def resolve
      ::Author.all
    end
  end  
end