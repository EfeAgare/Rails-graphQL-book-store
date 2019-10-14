# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
stephen = Author.create(first_name: 'Stephen', last_name: 'King', date_of_birth: Date.parse('1947-09-21'))
lee     = Author.create(first_name: 'Lee', last_name: 'Child', date_of_birth: Date.parse('1954-10-29'))

stephen.books.create(title: 'The Shining', publication_date: 1977, genre: 'Horror')
stephen.books.create(title: 'Carrie', publication_date: 1974, genre: 'Horror')
stephen.books.create(title: 'It', publication_date: 1986, genre: 'Horror')
stephen.books.create(title: 'Green mile', publication_date: 1996, genre: 'Mystery')
lee.books.create(title: 'Killing Floor', publication_date: 1997, genre: 'Thriller')
lee.books.create(title: 'Die Trying', publication_date: 1998, genre: 'Thriller')