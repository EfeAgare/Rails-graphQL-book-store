module Mutations
  module Books
    class CreateBook < ::Mutations::BaseMutation

      argument :author_id, ID, required: true
      argument :publication_date, Integer, required: true
      argument :title, String, required: true
      argument :genre, Types::Enums::Genre, required: true

      type Types::BookType


      def resolve(author_id:, **attribute)
        Author.find_by(id: author_id).books.create(attribute)
      end
    end
  end
  
end