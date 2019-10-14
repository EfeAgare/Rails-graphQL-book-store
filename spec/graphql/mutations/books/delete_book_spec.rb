require 'rails_helper'

module Mutations
  module Books

     RSpec.describe DeleteBook, type: :request do
      describe "delete book resolver" do

        let(:book) {create(:book)}
        let(:book1) {create(:book, title: 'Hero', publication_date: 1984, genre: 'Horror')}

        it "should delete a book" do 
  
            post '/graphql', params: { query: query(id: book.id) }
            
            expect { book }.to change { Book.count }.by(0)
        end


       

        it "should return a book" do

          post '/graphql', params: { query: query(id: book1.id) }

          json = JSON.parse(response.body)
          data = json['data']['deleteBook']

          expect(data).to include(
           'id'              => be_present,
            'title'           => 'Hero',
            'publicationDate' => 1984,
            'genre'           => 'Horror',
            'author'          => { 'id' => be_present }
          )

        end


        ## query method define
        def query(id:)
          <<~GQL
            mutation{
              deleteBook(
                id: #{id}
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