# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  name = Faker::Name.name[0...20]
  email    = "example-#{n+1}@test.com"
  password = "password"
  User.create!(name: name, email: email, password: password)
end

Book.create!(title: "Test",body: "first",user_id: 1)

5.times do |n|
  title = Faker::Book.title
  body  = "テスト"
  Book.create!(title: title, body: body, user_id: 1)
end