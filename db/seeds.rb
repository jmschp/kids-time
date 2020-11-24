# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed

duration = ['1 dia', '5 horas', '2 horas', '12 horas', '3 horas', '8 horas', '1 hora']
users = []

10.times do
  users << User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123123'
  )
end

50.times do
  act = Activity.new(
    title: Faker::Movie.title,
    description: Faker::Lorem.sentence(word_count: rand(75..150)),
    category: ACTIVITY_CATEGORIES.sample,
    duration: duration.sample,
    min_age: rand(2..10),
    price: rand(50..500)
  )
  act.user = users.sample
  act.save
end
