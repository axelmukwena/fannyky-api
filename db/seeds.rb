require 'faker'

User.delete_all
Painting.delete_all

10.times do
  User.create(email: Faker::Internet.unique.email,
              password: "password")
end

50.times do
  Painting.create({
                   title: Faker::Book.title,
                   body: Faker::Lorem.paragraphs(number: rand(5..7)),
                   user: User.limit(1).order('RANDOM()').first # sql random
                 })
end