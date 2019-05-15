# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Categories

frontend = Category.create(title: 'Frontend')
backend = Category.create(title: 'Backend')
mobile = Category.create(title: 'Mobile Development')

# Users

john = User.create(first_name: 'JohnSmith', email: 'johnSmith@testmail.org',
                   type: 'User', password: 'o4en_sekpetniy_parol', confirmed_at: Time.now)
daniel = User.create(first_name: 'DanielDefo', email: 'danie07defo@yahoomail.org',
                     type: 'User', password: 'o4en_sekpetniy_parol', confirmed_at: Time.now)
bill = User.create(first_name: 'BillGates', email: 'SillyBillyBoy@gmailtest.org',
                   type: 'User', password: 'o4en_sekpetniy_parol', confirmed_at: Time.now)


# Tests

swift = mobile.tests.create(name: 'Swift', level: 4, author: daniel)
ruby = backend.tests.create(name: 'Ruby', level: 2, author: bill)
html = frontend.tests.create(name: 'HTML', level: 0, author: john)
css = frontend.tests.create(name: 'CSS', level: 1, author: john)
go_lang = backend.tests.create(name: 'Go', level: 3, author: bill)


# Questions

questions = Question.create(
    [{body: 'What is the use of figure tag in HTML 5?', test: html},
     {body: 'What are the entities in HTML?', test: html},
     {body: 'Who created the Ruby Language?', test: ruby},
     {body: 'What is the default value of the instance variable?', test: ruby},
     {body: 'Why should one use Go programming language?', test: go_lang},
     {body: 'Why should one use Swift programming language in 2018?', test: swift}]
)


# Answers

Answer.create(
    [{body: 'Correct answer to HTML', correct: true, question: questions[0]},
     {body: 'Incorrect answer to HTML', correct: false, question: questions[0]},
     {body: 'Matz', correct: true, question: questions[2]},
     {body: 'John Doe', correct: false, question: questions[2]},
     {body: 'Linus Torvalds', correct: false, question: questions[2]},
     {body: 'Stefan Wintermeyer', correct: false, question: questions[2]},
     {body: 'Nil', correct: true, question: questions[3]},
     {body: 'false', correct: false, question: questions[3]}]
)

# Results

PassedTest.create(
    [{user: john, test: html},
     {user: john, test: css, },
     {user: daniel, test: ruby},
     {user: bill, test: go_lang}]
)
