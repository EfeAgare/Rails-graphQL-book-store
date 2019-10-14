module Queries
  class Books < Queries::BaseQuery
    description "Returns all book"

    type [Types::BookType], null: false

    def resolve
      ::Book.all
    end
  end  
end