FactoryBot.define do
  factory :book do
    author
    sequence(:title) {  "Best book ever" }
    publication_date { 1984 }
    genre { 'Thriller' }
  end
end