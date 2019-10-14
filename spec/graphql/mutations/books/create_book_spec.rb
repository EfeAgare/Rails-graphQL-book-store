require 'rails_helper'

module Mutations
  module Books

     RSpec.describe CreateBook, type: :request do
      describe "create book resolver" do

        let(:author) { create(:author) }

        it "creates a book" do 
          # let(:author) { create(:author) }  ## or 

          # author = create(:author)
          expect do
            post '/graphql', params: { query: query(author_id: author.id) }
          end.to change { Book.count }.by(1)
        end


       

        it "should return a book" do
          # author = create(:author)
          post '/graphql', params: { query: query(author_id: author.id) }

          json = JSON.parse(response.body)
          
          data = json['data']['createBook']

          expect(data).to include(
            'id'              => be_present,
            'title'           => 'Tripwire',
            'publicationDate' => 1999,
            'genre'           => 'Thriller',
            'author'          => { 'id' => author.id.to_s }
          )
        end


        ## query method define
        def query(author_id:)
          <<~GQL
            mutation{
              createBook(
                authorId: #{author_id}
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