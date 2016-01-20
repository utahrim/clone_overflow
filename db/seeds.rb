# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nick = User.create(username: "nick", password: "password")
june = User.create(username: "june", password: "password")
tahrim = User.create(username: "tahrim", password: "password")
andre = User.create(username: "andre", password: "password")

users = [nick, june, tahrim, andre]
questions = []
answers = []

tags= [Tag.create(name: "sports"), Tag.create(name: "celebs"), Tag.create(name: "music")]

users.each do |user|
  3.times do
    question = user.questions.create(title: Faker::Book.title, content: Faker::Lorem.paragraph(1))
    questions << question
    QuestionTag.create(question_id: question.id, tag_id: rand(1..3))
  end
end



users.each do |user|
  questions.each do |question|
    if question.user_id == user.id
      next
    end

    answers << Answer.create(user_id: user.id, question_id: question.id, content: Faker::Lorem.sentence(1))
  end
end

users.each do |user|
  questions.each do |question|
    if question.user_id == user.id
      next
    end

    question.comments.create(user_id: user.id, content: Faker::Lorem.sentence(1))
    question.votes.create(user_id: user.id, value: 1)
  end

  answers.each do |answer|
    if answer.user_id == user.id
      next
    end

    answer.comments.create(user_id: user.id, content: Faker::Lorem.sentence(1))
    answer.votes.create(user_id: user.id, value: 1)
  end
end