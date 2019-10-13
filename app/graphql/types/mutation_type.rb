module Types
  class MutationType < Types::BaseObject
    field :create_book, mutation: Mutations::Books::CreateBook
  end
end
