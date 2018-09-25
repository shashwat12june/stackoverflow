# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Users
User.create!(id: 0,
             first_name:  "example",
             last_name: "user",
             email: "example@railstutorial.org",
             phone_number: "9898898",
             password_digest: "foobar")

49.times do |n|
  first_name  = Faker::Name.first_name
  last_name =  Faker::Name.last_name
  email = Faker::Internet.email
  phone_number = Faker::PhoneNumber.phone_number
  password_digest = Faker::Internet.password
  User.create!(first_name:  first_name,
               last_name: last_name,
               email: email,
               phone_number: phone_number,
               password_digest:password_digest)
end


#Questions
Question.create!(id: 0,
                 question:  "what is c++",
                 status: "accepted",
                 user_id: 4,
                 vote_count: 3)

50.times do
  question = Faker::Lorem.question
  status = "new"
  vote_count = rand(20)
  user_no = rand(49)
  user = User.find(user_no)
  user.questions.create!(question: question, status: status,vote_count: vote_count)
end

#Answers
Answer.create!(id: 0,
                 answer:  "what is c++",
                 status: "accepted",
                 vote_count: 3,
                 question_id: 5,
                 user_id: 4,)

50.times do
  question_id = rand(48)
  user_no = rand(49)
  status = rand(2)
  vote_count = rand(20)
  user = User.find(user_no)
  answer = Faker::Lorem.paragraph
  user.answers.create!(answer: answer,status: status,vote_count: vote_count,question_id: question_id)
end

#Votes
