module Mutations
  module Books
    class CreateBook < ::Mutations::BaseMutation
      argument :title, String, required: true
      argument :author_id, Integer, required: true
      argument :publication_date, Integer, required: true
      argument :genre, String, required: true

      ## what is returned after mutation is complete
      type Types::BookType

      ## resolver 
      def resolve(author_id:, **attributes)
        Author.find(author_id).books.create!(attributes)
      end
    end
  end
end