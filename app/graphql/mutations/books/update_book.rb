module Mutations
  module Books

    class UpdateBook < ::Mutations::BaseMutation
      argument :id, ID, required: true
      argument :author_id, ID, required: false
      argument :publication_date, Integer, required: false
      argument :title, String, required: false
      argument :genre, Types::Enums::Genre, required: false

      type Types::BookType


      def resolve(id:, **attribute)
        Book.find_by(id: id).tap do |book|
          book.update!(attribute)
        end
      end
    end

  end
  
end