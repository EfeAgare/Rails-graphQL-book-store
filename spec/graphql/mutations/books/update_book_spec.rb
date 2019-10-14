require 'rails_helper'

module Mutations
  module Books

     RSpec.describe UpdateBook, type: :request do
      describe "update book resolver" do

        let(:book) {create(:book, title: 'Hero', publication_date: 1984, genre: 'Horror')}
        let(:author) {create(:author)}

        it "should update a book" do 
  
            post '/graphql', params: { query: query(id: book.id, author_id: author.id) }
            
            json = JSON.parse(response.body)
            data = json['data']['updateBook']

            expect(data).to include(
              'id'              => book.id.to_s,
              'title'           => 'Tripwire',
              'publicationDate' => 1999,
              'genre'           => 'Thriller',
              'author'          => { 'id' => author.id.to_s }
            )

        end


       

        it "should return a book" do

          post '/graphql', params: { query: query(id: book.id, author_id: author.id) }

          json = JSON.parse(response.body)
          data = json['data']['updateBook']

          expect(data).to include(
            'id'              => book.id.to_s,
            'title'           => 'Tripwire',
            'publicationDate' => 1999,
            'genre'           => 'Thriller',
            'author'          => { 'id' => author.id.to_s }
          )

        end


        ## query method define
        def query(id:, author_id:)
          <<~GQL
            mutation{
              updateBook(
                id: #{id}
                authorId:#{author_id} 
                title: "Tripwire"
                publicationDate: 1999
                genre: Thriller
              ) {
                id
                title
                genre
                publicationDate
                author {
                  id
                }
              }
            }
          GQL
        end

      end
    end
  end
end