# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

20.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::GreekPhilosophers.quote, email: Faker::Internet.email, age: rand(13..99), city_id: City.all.sample.id)
end

# 3. creation de 40 gossip puis les liaison aux utilisateurs

40.times do
  Gossip.create(title: Faker::Book.title, content: Faker::ChuckNorris.fact, user_id: User.all.sample.id)
end
