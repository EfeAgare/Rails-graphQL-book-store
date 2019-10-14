require 'rails_helper'

module Queries
  RSpec.describe Authors, type: :request do
    describe '.resolve' do

      let(:author){create(:author, first_name: 'Lee', last_name: 'Child', date_of_birth: Date.parse('1954-10-29'))}
      let(:author1) {create(:author, first_name: 'Stephen', last_name: 'King', date_of_birth: Date.parse('1947-09-21'))}
      let(:book){create(:book, author: author) }
      let(:book1){create(:book, author: author1) }
      it 'returns all authors' do
        

        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['authors']

        expect(data).to match_array [
          hash_including(
            'id'          => be_present,
            'firstName'   => 'Lee',
            'lastName'    => 'Child',
            'dateOfBirth' => '1954-10-29',
            'books'       => [{ 'id' => book.id.to_s }]
          ),
          hash_including(
            'id'          => be_present,
            'firstName'   => 'Stephen',
            'lastName'    => 'King',
            'dateOfBirth' => '1947-09-21',
            'books'       => [{ 'id' => book1.id.to_s }]
          )
        ]
      end
    end

    def query
      <<~GQL
        query {
          authors {
            id
            firstName
            lastName
            dateOfBirth
            books {
              id
            }
          }
        }
      GQL
    end
  end
end