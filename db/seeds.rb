
User.create!(id: 0,
             first_name:  "example",
             last_name: "users",
             email: "example@railstutorial.org",
             phone_number: "9898898123",
             password: "foobar")

20.times do |n|
  first_name  = Faker::Name.first_name
  last_name =  Faker::Name.last_name
  email = Faker::Internet.email
  phone_number = Faker::Number.number(10)
  password_digest = Faker::Internet.password
  User.create!(first_name:  first_name,
               last_name: last_name,
               email: email,
               phone_number: phone_number,
               password:password_digest)
end


#Questions
Question.create!(id: 0,
                 question:  "what is c++",
                 status: "accepted",
                 user_id: 4,
                 vote_count: 3)

2.times do
  users = User.order(:created_at).take(20)
  users.each do |user|
    question = Faker::Lorem.question
    status = "new"
    vote_count = rand(20)
    user.questions.create!(question: question, status: status, vote_count: vote_count)
  end
end

#Answers
Answer.create!(id: 0,
               answer:  "what is c++",
               status: "accepted",
               vote_count: 3,
               question_id: 5,
               user_id: 4,)


questions = Question.order(:created_at).take(40)
users = User.order(:created_at).take(20)
questions.each do |question|
  users.each do |user|
    status = rand(2)
    vote_count = rand(20)
    answer = Faker::Lorem.paragraph
    user.answers.create!(answer: answer, status: status, vote_count: vote_count, question_id: question.id)
  end
end


#Comments

questions = Question.order(:created_at).take(40)
users = User.order(:created_at).take(20)
answers = Answer.order(:created_at).take(10)
questions.each do |question|
  users.each do |user|
    comment = Faker::Lorem.sentence
    question.comments.create!(comment: comment, user_id: user.id)
  end
end
answers.each do |answer|
  users.each do |user|
    comment = Faker::Lorem.sentence
    answer.comments.create!(comment: comment, user_id: user.id)
  end
end

#Tags
Tag.create!(id: 0,
            tag_name: "Java")
20.times do
  tag_name = Faker::Lorem.word
  Tag.create!(tag_name: tag_name)
end

#answer_question_tags

100.times do
  tag_id = rand(20)
  question = Question.find(rand(40))
  answer = Answer.find(rand(20))
  question.answer_question_tags.create!(tag_id: tag_id)
  answer.answer_question_tags.create!(tag_id: tag_id)
end

#votes

users = User.order(:created_at).take(20)
questions = Question.order(:created_at).take(40)
answers = Answer.order(:created_at).take(10)
users.each do |user|
  vote_type = rand(2)
  questions.each do |question|
    question.votes.create!(user_id: user.id,vote_type: vote_type)
  end
  answers.each do |answer|
    answer.votes.create!(user_id: user.id,vote_type: vote_type)
  end
end
