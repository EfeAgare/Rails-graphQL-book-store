module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false
    field :date_of_birth, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :books, [Types:BookType], null: true
  end
  
end