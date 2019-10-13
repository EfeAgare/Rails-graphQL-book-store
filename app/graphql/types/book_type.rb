module Types
  class BookType < Base::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :author, Types::AuthorType, null: false
    field :publication_date, Integer, null: false
    field :genre, Enums::Genre, null: false
  end
end