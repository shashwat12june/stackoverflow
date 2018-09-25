# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Users
User.create!(first_name:  "example",
             last_name: "user",
             email: "example@railstutorial.org",
             phone_number: "9898898",
             password_digest: "foobar")

49.times do |n|
  first_name  = "sdfsdf"
  last_name =  "sdfsd"
  email = "example-#{n+1}@railstutorial.org"
  phone_number = "2224333"
  password_digest = "password"
  User.create!(first_name:  first_name,
               last_name: last_name,
               email: email,
               phone_number: phone_number,
               password_digest:password_digest)
end

users = User.order(:created_at).take(6)
50.times do
  base_question = "What is java question"
  status = "new"
  users.each do |user| question = base_question +" "+ user.id.to_s
  user.questions.create!(question: question, status: status)
  end
end